import 'dart:convert';

import 'package:flutter_bottom_nav/core/network/api_request_builder.dart';
import 'package:flutter_bottom_nav/core/network/encrypted_httpservice.dart';
import 'package:flutter_bottom_nav/core/static_variables.dart';
import 'package:http/http.dart';

class GetSearchData {
  static Future<Map<String, dynamic>> getdata({
    required String SAPCode,
    String? LeadNo,
    String? ReqName,
    String? PolicyNo,
    String? ReqMobNo,
    String? LOB,
    String? Product,
    String? AgentCode,
    String? HNINCode,
    String? FromDate,
    String? ToDate,
  }) async {
    final requestJson = ApiRequestBuilder.getSearchData(
      SAPCode: SAPCode,
      LeadNo: LeadNo,
      ReqName: ReqName,
      PolicyNo: PolicyNo,
      ReqMobNo: ReqMobNo,
      LOB: LOB,
      Product: Product,
      AgentCode: AgentCode,
      HNINCode: HNINCode,
      FromDate: FromDate,
      ToDate: ToDate,
      CallerId: StaticVariables.callerId,
      CallerPass: StaticVariables.callerPass,
      TokenId: StaticVariables.TokenId,
    );

    final String responseString = await EncryptedHttpservice.post(
      url: "${StaticVariables.baseUrl}/${StaticVariables.getSearchData}",
      requestJson: requestJson,
    );

    final Map<String, dynamic> JsonResponse = jsonDecode(responseString);
    return JsonResponse;
  }
}
