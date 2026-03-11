import 'dart:convert';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart' as enc;

import '../core/static_variables.dart';

class EncryptionUtil {
  static final enc.IV _iv = enc.IV(Uint8List(16)); // 16 zero bytes

  // Encrypt
  static String encrypt(String raw) {
    try {
      final encrypter = _getEncrypter();
      final encrypted = encrypter.encrypt(raw, iv: _iv);
      return encrypted.base64;
    } catch (e) {
      print("Encrypt Error: $e");
      return "";
    }
  }

  // Decrypt
  static String decrypt(String encrypted) {
    try {
      final cleanEncrypted = _sanitizeEncrypted(encrypted);
      final encrypter = _getEncrypter();
      final decrypted = encrypter.decrypt64(cleanEncrypted, iv: _iv);
      return decrypted;
    } catch (e) {
      print("Decrypt Error: $e");
      return "";
    }
  }

  // -----------------------------
  // Create Encrypter (Android getCipher equivalent)
  // -----------------------------
  static enc.Encrypter _getEncrypter() {
    final key = _generateKey();

    // Decode padding from server (Base64 → String)
    final decodedPadding = getHashValue(StaticVariables.pkcs5Padding!);

    // 🔑 IMPORTANT: Map Android padding → Flutter padding
    final flutterPadding = _mapPadding(decodedPadding);

    return enc.Encrypter(
      enc.AES(key, mode: enc.AESMode.cbc, padding: flutterPadding),
    );
  }

  // Generate AES Key (SHA-256 of decoded server key)
  static enc.Key _generateKey() {
    final decodedServerKey = getHashValue(StaticVariables.cipherServer!);

    final shaKey = sha256.convert(utf8.encode(decodedServerKey)).bytes;

    return enc.Key(Uint8List.fromList(shaKey));
  }

  // Same as Android GetHashValue()
  static String getHashValue(String value) {
    final decodedBytes = base64.decode(value);
    return utf8.decode(decodedBytes);
  }

  // -----------------------------
  // Padding mapper (CRITICAL)
  // -----------------------------
  static String _mapPadding(String padding) {
    if (padding.toUpperCase().contains("PKCS5")) {
      return "PKCS7"; // Flutter equivalent
    }
    return padding;
  }

  static String _sanitizeEncrypted(String value) {
    return value
        .trim()
        .replaceAll('"', '')
        .replaceAll('\n', '')
        .replaceAll('\r', '');
  }
}
