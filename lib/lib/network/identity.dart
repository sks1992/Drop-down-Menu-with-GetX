import 'dart:convert';

import 'package:get/get.dart';
import 'package:sample_login/models/auth_token.dart';
import 'package:sample_login/models/constants.dart';

class Identity extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = "http://192.168.1.15:91";
    httpClient.timeout = const Duration(minutes: 1);
    super.onInit();
  }

  Future<AuthTokenResult> getAuthToken(String mobile, String verifyCode,
      String fbToken, String loginType) async {
    await Future.delayed(const Duration(seconds: 1)); //for testing purpose only, remove later
    var _body =
        "client_id=${Constants.clientId}&client_secret=${Constants.clientSecret}"
        "&grant_type=${Constants.grantType}&userName=$mobile&password=$verifyCode&loginType=$loginType&fbToken=";

    var response = await post(
      "/connect/token",
      _body,
      contentType: "application/x-www-form-urlencoded",
    );

    if (!response.hasError) {
      var _result = AuthTokenResult(isSuccess: true, message: "");
      _result.authToken =
          AuthToken.fromJson(json.decode(response.bodyString!));
      return _result;
    } else {
      return AuthTokenResult(isSuccess: false, message: Constants.getHttpStatusMessage(response));
    }
  }

  Future<AuthToken> authenticateUser(
      {String? mobile,
        String? verifyCode,
        String? fbToken,
        String? loginType}) async {
    final data = {
      "username": mobile,
      "password": verifyCode,
      "loginType": loginType,
      "fbToken": fbToken,
    };

    return await getAuthToken();
  }

  /*
   Future<ClientCredAuthToken> authenticateWithClientCredentials() async {
    final data = {
      "grant_type": Constants.clientCredentialsGrantType,
      "client_id": Constants.clientId,
      "client_secret": Constants.clientSecret,
      "scope": Constants.nonClientScope,
    };

    final token = await _getAuthToken(data);
    return ClientCredAuthToken(
      accessToken: token.accessToken,
      expiresIn: token.expiresIn,
      tokenType: token.tokenType,
      nonClient: token.nonClient,
      nonClientName: token.nonClientName,
    );
  }
  * */

 /* Future<AuthToken> refreshUserAuthToken(String refreshToken) async {
    final data = {
      "grant_type": Constants.refreshTokenGrantType,
      "client_id": Constants.clientId,
      "client_secret": Constants.clientSecret,
      "refresh_token": refreshToken,
    };
    return await getAuthToken(data);
  }*/

/*
 Future<void> revokeAuthAndRefreshTokens(String refreshToken) async {
    //"token_type_hint=refresh_token" will revoke auth and refresh tokens
     await post(
      "/connect/revocation",
      "client_id=${Constants.clientId}&token=$refreshToken&token_type_hint=refresh_token",
      contentType: Constants.formUrlEncodedContentType,
    );
  }
*/

}
