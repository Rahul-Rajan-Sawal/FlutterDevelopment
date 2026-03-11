import 'dart:convert';

import 'package:flutter_bottom_nav/core/network/api_request_builder.dart';
import 'package:flutter_bottom_nav/core/network/encrypted_httpservice.dart';
import 'package:flutter_bottom_nav/core/static_variables.dart';
// import 'package:http/http.dart';

class AuthenticateUser {
  static Future<Map<String, dynamic>> login({
    required String userId,
    required String password,
    required String appVersion,
  }) async {
    final requestJson = ApiRequestBuilder.authenticateUserWithAppVersion(
      userId: userId,
      password: password,
      imeiString: "",
      appVersion: appVersion,
      sso: "N",
      callerId: StaticVariables.callerId,
      callerPass: StaticVariables.callerPass!,
      tokenId: StaticVariables.TokenId,
    );

    final String responseString = await EncryptedHttpservice.post(
      url: "${StaticVariables.baseUrl}/${StaticVariables.authenticateUser}",
      requestJson: requestJson,
    );

    final Map<String, dynamic> jsonResponse = jsonDecode(responseString);

    return jsonResponse;
  }
}
