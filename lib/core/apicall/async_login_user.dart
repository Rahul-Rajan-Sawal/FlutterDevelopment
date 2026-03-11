import 'package:flutter/material.dart';
import 'package:flutter_bottom_nav/common/common_util.dart';
import 'package:flutter_bottom_nav/core/network/api_request_builder.dart';
import 'package:flutter_bottom_nav/core/network/encrypted_httpservice.dart';
import 'package:flutter_bottom_nav/core/static_variables.dart';
//import 'package:package_info_plus/package_info_plus.dart';

Future<void> asyncLoginUser(
  BuildContext context,
  String userId,
  String password,
) async {
  try {
    // CommonUtil.showLoader(context, "Authenticating...");
    CommonUtil.show(context, message: "Authenticating...");

    //final packageInfo = await PackageInfo.fromPlatform();
    // final appVersion = packageInfo.buildNumber;
    final appVersion = "17";

    final requestJson = ApiRequestBuilder.authenticateUserWithAppVersionn(
      userId: userId,
      password: password,
      // imeiString: "${StaticVariables.imei}|${StaticVariables.androidId}",
      imeiString: "",
      appVersion: appVersion,
      sso: "N",
      callerId: StaticVariables.callerId,
      callerPass: StaticVariables.callerPass!,
      tokenId: StaticVariables.TokenId,
    );

    debugPrint("LOGIN REquest:");
    debugPrint(requestJson);

    final decryptedResponse = await EncryptedHttpservice.postEncryptedJson(
      "${StaticVariables.baseUrl}/AuthenticateUser_WithAppVersion",
      requestJson,
    );

    // Navigator.pop(context);

    debugPrint("DECRYPTED LOGIN RESPONSE:");
    debugPrint(decryptedResponse);

    CommonUtil.hide(context);
  } catch (e) {
    Navigator.pop(context);

    debugPrint("LOGIN ERROR: $e");

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Login failed")));

    CommonUtil.hide(context);
  }
}
