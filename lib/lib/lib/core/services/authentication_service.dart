import 'dart:convert';

import 'package:eskool/core/bindings/local_bindings.dart';
import 'package:eskool/core/models/auth_token.dart';
import 'package:eskool/core/models/result_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appauth/flutter_appauth.dart';
import 'package:get/get.dart';

import '../constants.dart';
import 'identity_api.dart';
import 'shared_service.dart';

class AuthenticationService extends GetxService {
  IdentityApi _identityApi = Get.find<IdentityApi>();
  final _sharedService = Get.find<SharedService>();

  late final FlutterAppAuth _appAuth = FlutterAppAuth();
  final List<String> _scopes = <String>['openid', 'offline_access', 'eSApi'];

  late final AuthorizationServiceConfiguration _serviceConfiguration =
      const AuthorizationServiceConfiguration(
          '${Constants.idServerBaseUrl}/connect/authorize',
          '${Constants.idServerBaseUrl}/connect/token');

  Future<ResultModel> authenticateUser() async {
    AuthorizationTokenResponse? result;
    try {
      result = await _appAuth.authorizeAndExchangeCode(
        AuthorizationTokenRequest(
          Constants.clientId,
          Constants.clientRedirectUri,
          allowInsecureConnections: true,
          serviceConfiguration: _serviceConfiguration,
          scopes: _scopes,
          promptValues: ['login'],
          preferEphemeralSession: true,
        ),
      );
    } on PlatformException catch (ex) {
      return ResultModel(false, "");
    }

    if (result == null) {
      return ResultModel(false, "Login failed.");
    }

    _storeAuthToken(AuthToken(
        loggedIn: true,
        accessToken: result.accessToken!,
        expiresIn: 0,
        tokenType: result.tokenType!,
        refreshToken: result.refreshToken!,
        setLoginPin: false,
        expiryDate: _sharedService.getFormattedTokenExpireDateTimeWithDate(
            result.accessTokenExpirationDateTime!)));

    return ResultModel(true, "");
  }

  void _storeAuthToken(AuthToken authToken) {
    LocalStorage.sharedInstance
        .writeValue(key: Constants.userAuthToken, value: authToken.accessToken);
    LocalStorage.sharedInstance.writeValue(
        key: Constants.userRefreshToken, value: authToken.refreshToken);
    LocalStorage.sharedInstance
        .writeValue(key: Constants.userToken, value: json.encode(authToken));
    LocalStorage.sharedInstance.writeValue(
        key: Constants.userAuthTokenExpiryTime, value: authToken.expiryDate);
  }

  void _storeUserName(String mobile) {
    LocalStorage.sharedInstance
        .writeValue(key: Constants.userName, value: mobile);
  }

  Future<void> revokeAuthAndRefreshTokens(String refreshToken) async {
    _identityApi.revokeAuthAndRefreshTokens(refreshToken);
  }
}
