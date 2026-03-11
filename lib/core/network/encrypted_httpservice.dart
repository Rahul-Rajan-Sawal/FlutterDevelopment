import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bottom_nav/common/encryption_util.dart';
import 'package:flutter_bottom_nav/core/network/dio_client.dart';
import 'package:flutter_bottom_nav/core/static_variables.dart';
import 'package:http/http.dart' as http;

class EncryptedHttpservice {
  static Future<String> postEncryptedJson(String url, String plainJson) async {
    try {
      // 🔐 Encrypt request
      final encrypted = EncryptionUtil.encrypt(plainJson);

      final requestBody = jsonEncode({"jsonInput": encrypted});

      final response = await http
          .post(
            Uri.parse(url),
            headers: {"Content-Type": "application/json"},
            body: requestBody,
          )
          .timeout(const Duration(minutes: 5));

      if (response.statusCode != 200) {
        throw Exception("HTTP ${response.statusCode}");
      }

      // 🔓 Decrypt response
      final decrypted = EncryptionUtil.decrypt(response.body);

      return decrypted;
    } catch (e) {
      rethrow;
    }
  }

  static Future<String> post({
    required String url,
    required Map<String, dynamic> requestJson,
  }) async {
    try {
      final encryptedJson = EncryptionUtil.encrypt(jsonEncode(requestJson));

      final payload = {"jsonInput": encryptedJson};

      final response = await DioClient.instance.post(
        url,
        data: jsonEncode(payload),
        options: Options(
          headers: {"authorization": StaticVariables.authorization},
        ),
      );

      final decrypted = EncryptionUtil.decrypt(response.data.toString());

      print("Decrypted: $decrypted");

      return decrypted;
    } catch (e) {
      print("Error: $e");
      rethrow;
    }
  }
}
