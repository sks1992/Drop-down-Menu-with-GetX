import 'package:eskool/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class Constants {
  //localhost
  //static const idServerBaseUrl = "http://10.0.2.2:5000";
  //static const apiBaseUrl = "http://10.0.2.2:5001/api";

  //dev server
  static const idServerBaseUrl = "http://192.168.1.15:88";
  static const apiBaseUrl = "http://192.168.1.15:89/api";

  static const formUrlEncodedContentType = "application/x-www-form-urlencoded";

  /* shared pref keys */
  static const String userName = "user_name";
  static const String userToken = "user_token";
  static const String userAuthToken = "user_auth_token";
  static const String userAuthTokenExpiryTime = "user_auth_token_expiry_time";
  static const String userRefreshToken = "user_refresh_token";

  /* id server client parameters */
  static const String refreshTokenGrantType = "refresh_token";
  static const String clientId = "mobile";
  static const String clientRedirectUri =
      "net.rmitsolutions.eskool://login-callback";
  static const String authorizationHeaderName = "Authorization";
  static const tokenType = "Bearer";

  static String getHttpStatusMessage(Response response) {
    if (response.status.connectionError) {
      return "Connection Error";
    } else if (response.status.isUnauthorized) {
      return "Unauthorized";
    } else if (response.status.isServerError) {
      return "Request failed";
    } else {
      if (response.body == null) {
        return "Error while request.";
      }
      return response.body["error_description"] ??
          response.body["error"] ??
          "Error while request.";
    }
  }

  static void hideKeyboard() {
    WidgetsBinding.instance?.focusManager.primaryFocus?.unfocus();
  }

  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 1,
      backgroundColor: colorRed,
      textColor: Colors.white,
    );
  }
}
