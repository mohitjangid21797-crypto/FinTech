import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class DataStorageService {
  static Future<Directory> get _appDir async {
    return await getApplicationDocumentsDirectory();
  }

  /// Get SQLite database file (if you use SQLite – optional, not used for backup)
  static Future<File> getDatabaseFile() async {
    final databasesPath = await getDatabasesPath();
    final pathName = path.join(databasesPath, 'loan_management.db');
    return File(pathName);
  }

  /// Load list from JSON file
  static Future<List<T>> loadListFromJson<T>(
    String filename,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final dir = await _appDir;
      final file = File(path.join(dir.path, filename));
      if (!await file.exists()) return [];
      final content = await file.readAsString();
      final List<dynamic> jsonList = json.decode(content);
      return jsonList.map((json) => fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error loading $filename: $e');
      return [];
    }
  }

  /// Save list to JSON file
  static Future<bool> saveListToJson<T>(
    String filename,
    List<T> items,
    Map<String, dynamic> Function(T) toJson,
  ) async {
    try {
      final dir = await _appDir;
      final file = File(path.join(dir.path, filename));
      await file.parent.create(recursive: true);
      final jsonList = items.map((item) => toJson(item)).toList();
      await file.writeAsString(json.encode(jsonList));
      return true;
    } catch (e) {
      debugPrint('Error saving $filename: $e');
      return false;
    }
  }

  /// Delete file
  static Future<bool> deleteFile(String filename) async {
    try {
      final dir = await _appDir;
      final file = File(path.join(dir.path, filename));
      if (await file.exists()) {
        await file.delete();
        return true;
      }
      return false;
    } catch (e) {
      debugPrint('Error deleting $filename: $e');
      return false;
    }
  }

  /// Create a single JSON backup file containing all app data
  static Future<File> getBackupFile() async {
    try {
      final dir = await _appDir;
      final tempDir = await getTemporaryDirectory();
      final backupFile = File(
        '${tempDir.path}/loan_app_backup_${DateTime.now().millisecondsSinceEpoch}.json',
      );

      final dataFiles = ['customers.json', 'loans.json', 'ledgers.json'];
      final backupData = <String, dynamic>{};

      for (final filename in dataFiles) {
        final file = File(path.join(dir.path, filename));
        if (await file.exists()) {
          final content = await file.readAsString();
          backupData[filename] = json.decode(content);
        } else {
          backupData[filename] = [];
        }
      }

      await backupFile.writeAsString(
        json.encode({
          'backup_timestamp': DateTime.now().toIso8601String(),
          'app_version': '3.0.0',
          'data': backupData,
        }),
      );
      return backupFile;
    } catch (e) {
      debugPrint('Error creating backup file: $e');
      rethrow;
    }
  }

  /// Restore from backup file (overwrites local JSON files)
  static Future<bool> restoreFromBackup(File backupFile) async {
    try {
      final content = await backupFile.readAsString();
      final backupJson = json.decode(content) as Map<String, dynamic>;
      final data = backupJson['data'] as Map<String, dynamic>? ?? {};

      final dir = await _appDir;
      for (final entry in data.entries) {
        final filename = entry.key;
        final fileData = entry.value;
        final file = File(path.join(dir.path, filename));
        await file.parent.create(recursive: true);
        await file.writeAsString(json.encode(fileData));
      }
      return true;
    } catch (e) {
      debugPrint('Error restoring backup: $e');
      return false;
    }
  }
}