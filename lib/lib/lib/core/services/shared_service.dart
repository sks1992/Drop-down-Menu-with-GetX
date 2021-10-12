import 'package:eskool/core/bindings/local_bindings.dart';
import 'package:intl/intl.dart';
import '../constants.dart';

class SharedService {
  Future<String> getUserToken() async {
    return await LocalStorage.sharedInstance.readValue(Constants.userToken);
  }

  Future<String> getAccessToken() async {
    return await LocalStorage.sharedInstance.readValue(Constants.userAuthToken);
  }

  Future<String> getRefreshToken() async {
    return await LocalStorage.sharedInstance.readValue(Constants.userRefreshToken);
  }

  String getFormattedTokenExpireDateTime(int expiresInSeconds) {
    final expiryDate = DateTime.now().add(Duration(seconds: expiresInSeconds));
    final format = DateFormat("yyyy-MM-dd HH:mm:ss");
    return format.format(expiryDate);
  }

  String getFormattedTokenExpireDateTimeWithDate(DateTime expiryDate) {
    final format = DateFormat("yyyy-MM-dd HH:mm:ss");
    return format.format(expiryDate);
  }

  Future<bool> _isTokenExpired(String sharedPrefKey) async {
    final expiryDateString =
    await LocalStorage.sharedInstance.readValue(sharedPrefKey);

    if (expiryDateString.isEmpty) {
      return true;
    }
    final expiryDate = DateTime.parse(expiryDateString);
    final diff = expiryDate.difference(DateTime.now());
    //if more than 5min
    return diff.inSeconds < 300;
  }

  Future<bool> userAuthTokenExpired() async {
    return _isTokenExpired(Constants.userAuthTokenExpiryTime);
  }

  Future<String> getUserMobile() async {
    return await LocalStorage.sharedInstance.readValue(Constants.userName);
  }
}
