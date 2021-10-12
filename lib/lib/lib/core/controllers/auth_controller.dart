import 'package:eskool/core/bindings/local_bindings.dart';
import 'package:eskool/core/services/authentication_service.dart';
import 'package:eskool/core/services/shared_service.dart';
import 'package:get/get.dart';

import '../../app_route.dart';
import '../constants.dart';

class AuthController extends GetxController {
  final _sharedService = Get.find<SharedService>();
  final _authService = Get.find<AuthenticationService>();
  var loggedIn = false.obs;

  @override
  onInit() async {
    ever(loggedIn, fireRoute);
    await userLoggedIn();
    super.onInit();
  }

  Future userLoggedIn() async {
    String savedToken = await _sharedService.getUserToken();
    loggedIn.value = !savedToken.isBlank!;
  }

  void fireRoute(bool isLogged) async {
    if (isLogged) {
      Get.offAllNamed(RouteNames.dashboard);
    } else {
      Get.offAllNamed(RouteNames.login);
    }
  }

  Future logout() async {
    final _refreshToken = await _sharedService.getRefreshToken();
    LocalStorage.sharedInstance.deleteValue(Constants.userToken);
    LocalStorage.sharedInstance.deleteValue(Constants.userAuthToken);
    LocalStorage.sharedInstance.deleteValue(Constants.userRefreshToken);
    LocalStorage.sharedInstance.deleteValue(Constants.userAuthTokenExpiryTime);
    try {
      await _authService.revokeAuthAndRefreshTokens(_refreshToken);
    } catch (e) {
      //ignore}
    }
    loggedIn.value = false;
  }
}
