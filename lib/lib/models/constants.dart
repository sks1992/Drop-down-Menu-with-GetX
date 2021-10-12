import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Constants {

  static const apiBaseUrl = "http://192.168.1.15:92/api";

  static const String userToken = "user_token";
  static const String userAuthToken = "user_auth_token";
  static const String userAuthTokenExpiryTime = "user_auth_token_expiry_time";
  static const String userRefreshToken = "user_refresh_token";
  static const String clientCredentialsAuthToken = "client_cred_auth_token";
  static const String clientCredentialsAuthTokenExpiryTime =
      "client_cred_auth_token_expiry_time";

  static const String pinLogin = "i";
  static const String otpLogin = "o";
  static const String fbToken = "t";

  /* id server client parameters */
  static const String grantType = "password";
  static const String refreshTokenGrantType = "refresh_token";
  static const String clientCredentialsGrantType = "client_credentials";
  static const String clientId = "olmsClientMobile";
  static const String clientSecret = "olmsClientMobile@rmit";
  static const String apiScope = "olmsApi";
  static const String nonClientScope = "nonClientApi";
  static const String authorizationHeaderName = "Authorization";

  static const String businessLoanType = "BL";
  static const String loanAgainstPropertyLoanType = "LP";



  /* date formats */
  static final dateFormatDDMMMYYYY = DateFormat("dd-MMM-yyyy");

  static String getHttpStatusMessage(Response response) {
    if (response.status.connectionError) {
      return "connection_error";
    } else if (response.status.isUnauthorized) {
      return "unauthorized";
    } else if (response.status.isServerError) {
      return "request_failed";
    } else {
      if (response.body == null) {
        return "error_while_request";
      }
      return response.body["error_description"] ??
          response.body["error"] ??
          "error_while_request";
    }
  }
}