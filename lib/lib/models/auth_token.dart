import 'package:sample_login/models/result_model.dart';

class AuthToken {
  bool loggedIn = false;
late String accessToken;
late int expiresIn;
late String tokenType;
late String refreshToken;
late bool nonClient;
late String nonClientName;

  AuthToken({
   required this.loggedIn,
   required this.accessToken,
   required this.expiresIn,
   required this.tokenType,
   required this.refreshToken,
   required this.nonClient,
   required this.nonClientName,
  });

  AuthToken.initial()
      : loggedIn = false,
        accessToken = "",
        expiresIn = 0,
        tokenType = "",
        refreshToken = "",
        nonClient = false,
        nonClientName = "";

  AuthToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    nonClient = json['non_client'];
    nonClientName = json['non_client_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] =accessToken;
    data['expires_in'] = expiresIn;
    data['token_type'] = tokenType;
    data['refresh_token'] =refreshToken;
    data['non_client'] = nonClient;
    data['non_client_name'] = nonClientName;
    return data;
  }
}

class AuthTokenResult extends ResultModel {
  AuthTokenResult({required bool isSuccess,required String message}) : super(isSuccess, message);
  late AuthToken authToken;
}