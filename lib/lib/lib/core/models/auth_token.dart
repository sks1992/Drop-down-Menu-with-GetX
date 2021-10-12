import 'result_model.dart';

class AuthToken {
  bool loggedIn = false;
  late String accessToken;
  late int expiresIn;
  late String tokenType;
  late String refreshToken;
  late bool setLoginPin;
  late String expiryDate;

  AuthToken({
    required this.loggedIn,
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
    required this.refreshToken,
    required this.setLoginPin,
    required this.expiryDate,
  });

  AuthToken.initial()
      : loggedIn = false,
        accessToken = "",
        expiresIn = 0,
        tokenType = "",
        refreshToken = "",
        setLoginPin = false,
        expiryDate = "";

  AuthToken.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    expiresIn = json['expires_in'];
    tokenType = json['token_type'];
    refreshToken = json['refresh_token'];
    setLoginPin = json['user_pin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['access_token'] = this.accessToken;
    data['expires_in'] = this.expiresIn;
    data['token_type'] = this.tokenType;
    data['refresh_token'] = this.refreshToken;
    data['user_pin'] = this.setLoginPin;
    return data;
  }
}

class AuthTokenResult extends ResultModel {
  AuthTokenResult(bool isSuccess, String message) : super(isSuccess, message);
  late AuthToken authToken;
}
