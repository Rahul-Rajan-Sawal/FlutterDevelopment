import 'dart:convert';

class ApiRequestBuilder {


static Map<String, dynamic> buildSearchLeadRequest({
  required String sapCode,
  required String leadNo,
  required String policyNo,
  required String tokenId,
  required String callerId,
  required String callerPass,
}) {
  return {
   
  //    "objSearchLead": {
  //   "SAPCode": sapCode,
  //   "LeadNo": leadNo,
  //   "PolicyNo": policyNo,
  //   "CallerId": callerId,
  //   "CallerPass": callerPass,
  //   "TokenId": tokenId,
  // }
     "UserId": sapCode,
    "LeadNo": leadNo,
    "PolicyNo": policyNo,
    "CallerId": callerId,
    "CallerPass": callerPass,
    "TokenId": tokenId,
  };
}

  static String authenticateUserWithAppVersionn({
    required String userId,
    required String password,
    required String imeiString,
    required String appVersion,
    required String sso,
    required String callerId,
    required String callerPass,
    required String tokenId,
  }) {
    return jsonEncode({
      "UserId": userId,
      "Password": password,
      "IMEIstring": imeiString,
      "AppVersion": appVersion,
      "SSO": sso,
      "CallerId": callerId,
      "CallerPass": callerPass,
      "TokenId": tokenId,
    });
  }

  static Map<String, dynamic> authenticateUserWithAppVersion({
    required String userId,
    required String password,
    required String imeiString,
    required String appVersion,
    required String sso,
    required String callerId,
    required String callerPass,
    required String tokenId,
  }) {
    return {
      "UserId": userId,
      "Password": password,
      "IMEIstring": imeiString,
      "AppVersion": appVersion,
      "SSO": sso,
      "CallerId": callerId,
      "CallerPass": callerPass,
      "TokenId": tokenId,
    };
  }

  static Map<String, dynamic> getDashboardData({
    required String UserId,
    String? CurMonth,
    String? CallerId,
    String? CallerPass,
    String? TokenId,
  }) {
    return {
      "UserId": UserId,
      "CurMonth": CurMonth,
      "CallerId": CallerId,
      "CallerPass": CallerPass,
      "TokenId": TokenId,
    };
  }

  static Map<String, dynamic> getSearchData({
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
    String? CallerId,
    String? CallerPass,
    String? TokenId,
  }) {
    return {
      "UserId": SAPCode,
      "LeadNo": LeadNo,
      "ReqName": ReqName,
      "PolicyNo": PolicyNo,
      "ReqMobNo": ReqMobNo,
      "LOB": LOB,
      "Product": Product,
      "AgentCode": AgentCode,
      "HNINCode": HNINCode,
      "FromDate": FromDate,
      "ToDate": ToDate,
      "CallerId": CallerId,
      "CallerPass": CallerPass,
      "TokenId": TokenId,
    };
  }




}
