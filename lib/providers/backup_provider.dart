// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:loan_management_app/services/google_drive_backup_service.dart';

class BackupProvider with ChangeNotifier {
  // Single shared instance — preserves sign-in state and progress across calls.
  final GoogleDriveBackupService _driveService = GoogleDriveBackupService();

  GoogleSignInAccount? _currentAccount;
  GoogleSignInAccount? get currentAccount => _currentAccount;
  bool get isSignedIn => _currentAccount != null;

  // Progress notifiers delegate directly to the service so the UI always
  // reflects real upload/download state without any manual syncing.
  ValueNotifier<double> get uploadProgress => _driveService.uploadProgress;
  ValueNotifier<double> get downloadProgress => _driveService.downloadProgress;

  final ValueNotifier<bool> isBackupInProgress = ValueNotifier(false);
  final ValueNotifier<bool> isRestoreInProgress = ValueNotifier(false);
  final ValueNotifier<String?> backupStatus = ValueNotifier(null);

  // ---------------------------------------------------------------------------
  // Sign-in / sign-out
  // ---------------------------------------------------------------------------

  /// Signs in with Google. Returns true if sign-in succeeded.
  Future<bool> signInWithGoogle(BuildContext context) async {
    try {
      final signedIn = await _driveService.signInIfNeeded();
      if (!signedIn) {
        _showSnackBar(context, 'Google Sign-In was cancelled');
        return false;
      }

      // Expose the current account via the public getter on the service.
      _currentAccount = _driveService.currentUser;
      notifyListeners();

      _showSnackBar(context, 'Signed in as ${_currentAccount!.email}');
      return true;
    } catch (e) {
      debugPrint('Google Sign-In failed: $e');
      _showSnackBar(context, 'Sign-in failed: $e');
      return false;
    }
  }

  /// Signs out and resets all state.
  Future<void> signOut() async {
    await _driveService.signOut();
    _currentAccount = null;
    backupStatus.value = null;
    notifyListeners();
  }

  // ---------------------------------------------------------------------------
  // Backup
  // ---------------------------------------------------------------------------

  /// Uploads an encrypted backup to Google Drive's appDataFolder.
  Future<bool> backupData(BuildContext context) async {
    // Ensure the user is signed in before proceeding.
    if (_currentAccount == null) {
      final ok = await signInWithGoogle(context);
      if (!ok) return false;
    }

    isBackupInProgress.value = true;
    notifyListeners();

    try {
      final success = await _driveService.uploadDatabaseBackup();

      if (success) {
        backupStatus.value = 'Last backup: ${_formattedNow()}';
        _showSnackBar(context, '✅ Backup completed to Google Drive');
      } else {
        _showSnackBar(context, '❌ Backup failed');
      }

      return success;
    } catch (e) {
      debugPrint('Backup error: $e');
      _showSnackBar(context, 'Backup failed: $e');
      return false;
    } finally {
      isBackupInProgress.value = false;
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Restore
  // ---------------------------------------------------------------------------

  /// Downloads and restores a backup from Google Drive, then restarts the app.
  Future<bool> restoreData(BuildContext context) async {
    // Ensure the user is signed in before proceeding.
    if (_currentAccount == null) {
      final ok = await signInWithGoogle(context);
      if (!ok) return false;
    }

    isRestoreInProgress.value = true;
    notifyListeners();

    try {
      final success = await _driveService.restoreDatabaseBackup();

      if (!success) {
        _showSnackBar(context, '❌ Restore failed');
        return false;
      }

      _showSnackBar(context, '✅ Restore completed. Restarting app…');

      // Give the SnackBar a moment to show before rebirth.
      await Future.delayed(const Duration(seconds: 1));
      if (context.mounted) Phoenix.rebirth(context);

      return true;
    } catch (e) {
      debugPrint('Restore error: $e');
      _showSnackBar(context, 'Restore failed: $e');
      return false;
    } finally {
      isRestoreInProgress.value = false;
      notifyListeners();
    }
  }

  // ---------------------------------------------------------------------------
  // Dispose
  // ---------------------------------------------------------------------------

  @override
  void dispose() {
    // Do NOT dispose uploadProgress / downloadProgress here — they belong to
    // _driveService and will be disposed when the service itself is disposed.
    _driveService.dispose();
    isBackupInProgress.dispose();
    isRestoreInProgress.dispose();
    backupStatus.dispose();
    super.dispose();
  }

  // ---------------------------------------------------------------------------
  // Private helpers
  // ---------------------------------------------------------------------------

  void _showSnackBar(BuildContext context, String message) {
    if (!context.mounted) return;
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  String _formattedNow() {
    final now = DateTime.now();
    return '${now.day}/${now.month}/${now.year} '
        '${now.hour.toString().padLeft(2, '0')}:'
        '${now.minute.toString().padLeft(2, '0')}';
  }
}
