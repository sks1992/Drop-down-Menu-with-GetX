import 'dart:convert';

import 'package:eskool/core/models/auth_token.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'shared_service.dart';

class IdentityApi extends GetConnect {
  SharedService _sharedService = Get.find<SharedService>();

  @override
  void onInit() {
    httpClient.baseUrl = Constants.idServerBaseUrl;
    httpClient.timeout = Duration(minutes: 1);
    httpClient.addAuthenticator<void>((request) async {
      var _token = await _sharedService.getAccessToken();
      request.headers[Constants.authorizationHeaderName] =
      '${Constants.tokenType} $_token';
      return request;
    });

    super.onInit();
  }

  Future<AuthTokenResult> _getAuthToken(String body) async {
    var response = await post(
      "/connect/token",
      body,
      contentType: Constants.formUrlEncodedContentType,
    );

    if (!response.hasError) {
      var _result = AuthTokenResult(true, "");
      _result.authToken = AuthToken.fromJson(json.decode(response.bodyString!));
      return _result;
    } else {
      return AuthTokenResult(false, Constants.getHttpStatusMessage(response));
    }
  }

  Future<void> revokeAuthAndRefreshTokens(String refreshToken) async {
    //"token_type_hint=refresh_token" will revoke auth and refresh tokens
     await post(
      "/connect/revocation",
      "client_id=${Constants.clientId}&token=$refreshToken&token_type_hint=refresh_token",
      contentType: Constants.formUrlEncodedContentType,
    );
  }
}