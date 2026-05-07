import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:path_provider/path_provider.dart';

class BackupEncryption {
  /// Derive 32-byte key from email + salt using PBKDF2-like derivation
  static Uint8List deriveKey(
    String email, {
    String salt = 'loan_app_backup_v1',
  }) {
    List<int> data = utf8.encode(email + salt);
    for (int i = 0; i < 10000; i++) {
      data = sha256.convert(data).bytes;
    }
    return Uint8List.fromList(List<int>.from(data.sublist(0, 32)));
  }

  /// Encrypt file and return temp encrypted file
  static Future<File> encryptFile(File inputFile, String userEmail) async {
    final key = Key(deriveKey(userEmail));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));
    final iv = IV.fromSecureRandom(16);

    final inputBytes = await inputFile.readAsBytes();
    final encrypted = encrypter.encryptBytes(inputBytes, iv: iv);

    final tempDir = await getTemporaryDirectory();
    final outputFile = File(
      '${tempDir.path}/encrypted_${DateTime.now().millisecondsSinceEpoch}.enc',
    );
    await outputFile.writeAsBytes([...iv.bytes, ...encrypted.bytes]);
    return outputFile;
  }

  /// Decrypt encrypted file and return temp decrypted file
  static Future<File> decryptFile(File encryptedFile, String userEmail) async {
    final key = Key(deriveKey(userEmail));
    final encrypter = Encrypter(AES(key, mode: AESMode.cbc));

    final bytes = await encryptedFile.readAsBytes();
    if (bytes.length < 16) throw Exception('Invalid encrypted file');

    final iv = IV(bytes.sublist(0, 16));
    final encryptedData = Encrypted(bytes.sublist(16));

    final decryptedBytes = encrypter.decryptBytes(encryptedData, iv: iv);

    final tempDir = await getTemporaryDirectory();
    final outputFile = File(
      '${tempDir.path}/decrypted_${DateTime.now().millisecondsSinceEpoch}.db',
    );
    await outputFile.writeAsBytes(decryptedBytes);
    return outputFile;
  }
}