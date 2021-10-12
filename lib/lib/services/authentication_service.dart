import 'dart:async';
import 'dart:convert';
import 'package:get/get.dart';
import 'package:sample_login/bindings/local_bindings.dart';
import 'package:sample_login/models/auth_token.dart';
import 'package:sample_login/models/constants.dart';
import 'package:sample_login/models/result_model.dart';
import 'package:sample_login/network/identity.dart';
import 'package:sample_login/services/shared_service.dart';


class AuthenticationService {
 final Identity _identity = Get.find<Identity>();
  final _sharedService = Get.find<SharedService>();

  Future<AuthToken> userLoggedIn() async {
    String savedToken =
    await LocalStorage.sharedInstance.readValue(Constants.userToken);
    if (savedToken == null || savedToken.isEmpty) {
      return AuthToken.initial();
    }
    final _authToken = AuthToken.fromJson(json.decode(savedToken));
    _authToken.loggedIn = true;
    return _authToken;
  }

  Future<ResultModel> authenticateUser(
      {String? mobile,
        String? verifyCode,
        String? fbToken,
        String? loginType}) async {
    final result = ResultModel(false, "");
    try {
      var authToken = await _identity.authenticateUser(
          mobile: mobile,
          verifyCode: verifyCode,
          fbToken: fbToken,
          loginType: loginType);
      result.isSuccess = authToken != null;
      if (result.isSuccess) {
        authToken.isSuccess = true;
        _storeAuthToken(authToken);
      }
      return result;
    } on Exception catch (err) {
      if (err.response != null) {
        final response = json.decode(err.response.toString());
        result.message =
            response["error_description"] ?? "Couldn't authenticate user";
      } else {
        result.message = err.message;
      }
      return result;
    }
  }

  void _storeAuthToken(AuthToken authToken) {
    LocalStorage.sharedInstance
        .writeValue(key: Constants.userAuthToken, value: authToken.accessToken);
    LocalStorage.sharedInstance.writeValue(
        key: Constants.userRefreshToken, value: authToken.refreshToken);
    LocalStorage.sharedInstance
        .writeValue(key: Constants.userToken, value: json.encode(authToken));
    LocalStorage.sharedInstance.writeValue(
        key: Constants.userAuthTokenExpiryTime,
        value: _sharedService
            .getFormattedTokenExpireDateTime(authToken.expiresIn));
  }

/*  Future<ResultModel> authenticateWithClientCredentials() async {
    final result = ResultModel(false, "");
    try {
      var crToken = await _identityApi.authenticateWithClientCredentials();
      result.isSuccess = crToken != null;
      if (result.isSuccess) {
        _storeClientCredentialsAuthToken(crToken);
      }
      return result;
    } on DioError catch (err) {
      if (err.response != null) {
        final response = json.decode(err.response.toString());
        result.message =
            response["error_description"] ?? "Couldn't get the page";
      } else {
        result.message = err.message;
      }
      return result;
    }
  }*/

 /* void _storeClientCredentialsAuthToken(ClientCredAuthToken token) {
    LocalStorage.sharedInstance.writeValue(
        key: Constants.clientCredentialsAuthToken, value: token.accessToken);
    LocalStorage.sharedInstance.writeValue(
        key: Constants.clientCredentialsAuthTokenExpiryTime,
        value: _sharedService.getFormattedTokenExpireDateTime(token.expiresIn));
  }*/

  Future<bool> refreshUserAuthToken() async {
    try {
      if (!await _sharedService.userAuthTokenExpired()) {
        return true;
      }

      final refreshToken = await LocalStorage.sharedInstance
          .readValue(Constants.userRefreshToken);
      if (refreshToken == null) {
        return false;
      }
      final _token = await _identityApi.refreshUserAuthToken(refreshToken);
      if (_token != null) {
        _storeAuthToken(_token);
        return true;
      }
      return false;
    } on DioError catch (err) {
      return false;
    }
  }

  Future<void> revokeAuthAndRefreshTokens(String refreshToken) async {
    try {
      await _identity.revokeAuthAndRefreshTokens(refreshToken);
    } catch (err) {
      //ignore}
    }
  }

  Future<void> logout() async {
    final _token = await _sharedService.getRefreshToken();
    LocalStorage.sharedInstance.deleteValue(Constants.userToken);
    LocalStorage.sharedInstance.deleteValue(Constants.userAuthToken);
    LocalStorage.sharedInstance.deleteValue(Constants.userRefreshToken);
    LocalStorage.sharedInstance.deleteValue(Constants.userAuthTokenExpiryTime);
    Constants.clientClosedLoans = null;
    Constants.clientLoan = null;
    Constants.profile = null;
    try {
      await FirebaseAuth.instance.signOut();
      await revokeAuthAndRefreshTokens(_token);
    } catch (e) {
      //ignore}
    }
  }
}
