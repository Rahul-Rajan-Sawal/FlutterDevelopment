import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpRequestBuilder {
  static Future<String> postApiRequest(
    String url,
    Map<String, dynamic> requestParam,
  ) async {
    final jsonObject = {
      "AppName": base64Url.encode(utf8.encode("SmartTracker")),
      "CallerId": "",
      "CallerPass": "",
      "TokenId": "",
    };

    final finalRequest = {"jsonInput": jsonEncode(jsonObject)};

    final response = await http.post(
      Uri.parse(url),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(finalRequest),
    );

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception("API Error");
    }
  }
}
