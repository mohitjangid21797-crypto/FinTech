import 'dart:async';
import 'dart:io' as io;
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googleapis/drive/v3.dart' as drive;
import 'package:mime/mime.dart';
import 'package:loan_management_app/services/backup_encryption.dart';
import 'package:loan_management_app/services/data_storage_service.dart';
import 'package:path_provider/path_provider.dart';

/// Service for backing up and restoring app data using Google Drive's hidden App Data folder.
class GoogleDriveBackupService {
  final ValueNotifier<double> _uploadProgress = ValueNotifier(0.0);
  final ValueNotifier<double> _downloadProgress = ValueNotifier(0.0);

  ValueNotifier<double> get uploadProgress => _uploadProgress;
  ValueNotifier<double> get downloadProgress => _downloadProgress;

  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: ['https://www.googleapis.com/auth/drive.appdata'],
  );

  GoogleSignInAccount? get currentUser => null;

  /// Returns an authenticated Drive API client.
  Future<drive.DriveApi> _getDriveClient() async {
    final account = _googleSignIn.currentUser;
    if (account == null) throw Exception('Not signed in to Google');
    final headers = await account.authHeaders;
    final client = GoogleAuthClient(headers);
    return drive.DriveApi(client);
  }

  /// Generates a unique filename for the user's backup.
  String _getBackupFilename(String email) =>
      'backup_${email.replaceAll(RegExp(r'[@.]'), '_')}.json.enc';

  /// Checks if a backup file already exists in the App Data folder.
  Future<drive.File?> _findBackupFile(
    drive.DriveApi driveApi,
    String email,
  ) async {
    final filename = _getBackupFilename(email);
    final query =
        "'appDataFolder' in parents and name = '$filename' and trashed = false";
    final result = await driveApi.files.list(
      q: query,
      spaces: 'appDataFolder',
    );
    if (result.files == null || result.files!.isEmpty) return null;
    return result.files!.first;
  }

  /// Signs in if not already signed in. Returns true if signed in.
  Future<bool> signInIfNeeded() async {
    if (_googleSignIn.currentUser == null) {
      final account = await _googleSignIn.signIn();
      return account != null;
    }
    return true;
  }

  /// Uploads the encrypted JSON backup to Google Drive.
  /// Returns true on success, throws exception on failure.
  Future<bool> uploadDatabaseBackup() async {
    try {
      _uploadProgress.value = 0.0;

      if (!await signInIfNeeded()) {
        throw Exception('Google Sign-In failed');
      }

      final account = _googleSignIn.currentUser!;
      final driveApi = await _getDriveClient();
      _uploadProgress.value = 0.1;

      final backupFile = await DataStorageService.getBackupFile();
      _uploadProgress.value = 0.2;

      final encryptedFile = await BackupEncryption.encryptFile(
        backupFile,
        account.email,
      );
      _uploadProgress.value = 0.3;

      final filename = _getBackupFilename(account.email);
      final mimeType = lookupMimeType(filename) ?? 'application/octet-stream';
      final existingFile = await _findBackupFile(driveApi, account.email);

      final fileMetadata = drive.File(
        name: filename,
        parents: ['appDataFolder'],
      );

      final media = drive.Media(
        encryptedFile.openRead(),
        await encryptedFile.length(),
        contentType: mimeType,
      );

      if (existingFile != null) {
        // ✅ FIX 1: Use named parameter 'uploadMedia'
        await driveApi.files.update(
          fileMetadata,
          existingFile.id!,
          uploadMedia: media,
        );
      } else {
        await driveApi.files.create(fileMetadata, uploadMedia: media);
      }

      _uploadProgress.value = 1.0;

      await backupFile.delete();
      await encryptedFile.delete();

      debugPrint('✅ Backup uploaded successfully: $filename');
      return true;
    } catch (e) {
      debugPrint('❌ Backup upload failed: $e');
      _uploadProgress.value = 0.0;
      rethrow;
    }
  }

  /// Downloads and restores the latest backup from Google Drive.
  /// Returns true on success, throws exception on failure.
  Future<bool> restoreDatabaseBackup() async {
    try {
      _downloadProgress.value = 0.0;

      if (!await signInIfNeeded()) {
        throw Exception('Google Sign-In failed');
      }

      final account = _googleSignIn.currentUser!;
      final driveApi = await _getDriveClient();
      _downloadProgress.value = 0.1;

      final backupFile = await _findBackupFile(driveApi, account.email);
      if (backupFile == null) {
        throw Exception('No backup found for ${account.email}');
      }

      // ✅ FIX 2: Use the size from the already fetched file metadata
      // 'size' is a String? from drive.File, convert to int
      final sizeStr = backupFile.size;
      final int? totalBytes = sizeStr != null ? int.tryParse(sizeStr) : null;

      final tempDir = await getTemporaryDirectory();
      final tempEncPath = '${tempDir.path}/backup.enc';
      final tempEncFile = io.File(tempEncPath);

      final media = await driveApi.files.get(
            backupFile.id!,
            downloadOptions: drive.DownloadOptions.fullMedia,
          ) as drive.Media;

      final sink = tempEncFile.openWrite();
      int bytesWritten = 0;
      await for (final chunk in media.stream) {
        sink.add(chunk);
        bytesWritten += chunk.length;
        if (totalBytes != null && totalBytes > 0) {
          _downloadProgress.value = 0.2 + (bytesWritten / totalBytes) * 0.6;
        } else {
          // fallback if size unknown
          _downloadProgress.value += 0.01;
          if (_downloadProgress.value > 0.8) _downloadProgress.value = 0.8;
        }
      }
      await sink.close();
      _downloadProgress.value = 0.8;

      final decryptedFile = await BackupEncryption.decryptFile(
        tempEncFile,
        account.email,
      );
      _downloadProgress.value = 0.9;

      final success = await DataStorageService.restoreFromBackup(decryptedFile);
      _downloadProgress.value = 1.0;

      await tempEncFile.delete();
      await decryptedFile.delete();

      debugPrint('✅ Restore completed successfully');
      return success;
    } catch (e) {
      debugPrint('❌ Restore failed: $e');
      _downloadProgress.value = 0.0;
      rethrow;
    }
  }

  /// Signs out from Google.
  Future<void> signOut() async {
    await _googleSignIn.signOut();
    _uploadProgress.value = 0.0;
    _downloadProgress.value = 0.0;
  }

  /// Disposes progress notifiers.
  void dispose() {
    _uploadProgress.dispose();
    _downloadProgress.dispose();
  }
}

/// Custom HTTP client that attaches OAuth headers to every request.
class GoogleAuthClient extends http.BaseClient {
  final Map<String, String> _headers;
  final http.Client _client = http.Client();

  GoogleAuthClient(this._headers);

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.addAll(_headers);
    return await _client.send(request);
  }

  @override
  void close() {
    _client.close();
  }
}