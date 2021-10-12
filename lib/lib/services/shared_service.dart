import 'package:intl/intl.dart';
import 'package:sample_login/bindings/local_bindings.dart';
import 'package:sample_login/models/constants.dart';


class SharedService {

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

  Future<bool> _isTokenExpired(String sharedPrefKey) async {
    final expiryDateString =
    await LocalStorage.sharedInstance.readValue(sharedPrefKey);

    if (expiryDateString == null) {
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
}
