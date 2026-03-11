import 'dart:convert';

import 'package:encrypt/encrypt.dart' as encrypt;
import 'package:flutter_bottom_nav/core/static_variables.dart';

class KeyDecryptor {
  static String serverKey = "";
  static String pad = "";
  static String apiKey = "";
  static String sharedKey = "";
  static String dbKey = "";
  static String authorization = "";

  static void extractDecryptedKeys(String encryptedResponse) {
    try {
      // Step 1: AES Decrypt
      String cleaned = encryptedResponse.trim();

      // Remove wrapping quotes if present
      if (cleaned.startsWith('"') && cleaned.endsWith('"')) {
        cleaned = cleaned.substring(1, cleaned.length - 1);
      }

      // Remove line breaks / spaces
      cleaned = cleaned
          .replaceAll('\n', '')
          .replaceAll('\r', '')
          .replaceAll(' ', '');

      final decryptedJson = _decryptAES(
        cleaned,
        StaticVariables.bootstrapAesKey,
        StaticVariables.initVector,
      );

      print("AES: $decryptedJson");

      // Step 2: Parse JSON
      final jsonObject = jsonDecode(decryptedJson);
      final tableArray = jsonObject["Table"];
      final keyObject = tableArray[0];

      if (keyObject["ResponseCode"] == "0") {
        serverKey = keyObject["server"];
        pad = keyObject["pad"];
        apiKey = keyObject["api_key"];
        sharedKey = _decodeBase64(keyObject["shared_key"]);
        dbKey = keyObject["dbKey"];
        authorization = _decodeBase64(keyObject["Authorization"]);
      }
    } catch (e) {
      print("KeyDecryptor Error: $e");
    }
  }

  // 🔐 AES/CBC/PKCS5Padding (MATCHES ANDROID)
  static String _decryptAES(String encryptedBase64, String key, String iv) {
    final encryptedBytes = base64.decode(encryptedBase64);

    final aesKey = encrypt.Key.fromUtf8(key);
    final ivSpec = encrypt.IV.fromUtf8(iv);

    final encrypter = encrypt.Encrypter(
      encrypt.AES(
        aesKey,
        mode: encrypt.AESMode.cbc,
        padding: 'PKCS7', // PKCS5 == PKCS7 for AES
      ),
    );

    final decryptedBytes = encrypter.decryptBytes(
      encrypt.Encrypted(encryptedBytes),
      iv: ivSpec,
    );
    return utf8.decode(decryptedBytes);
  }

  // Base64 DEFAULT (same as Android Base64.DEFAULT)
  static String _decodeBase64(String encodedStr) {
    final decodedBytes = base64.decode(encodedStr);
    return utf8.decode(decodedBytes);
  }
}
