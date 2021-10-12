import 'package:get/get.dart';

import '../app_route.dart';

class AuthController extends GetxController {
  var loggedIn = false.obs;

  @override
  onInit() async {
    ever(loggedIn, fireRoute);
    super.onInit();
  }

  void fireRoute(bool isLogged) async {
    if (isLogged) {
      Get.offAllNamed(RouteNames.dashboard);
    } else {
      Get.offAllNamed(RouteNames.home);
    }
  }

  Future logout() async {
    //clear all local data before logout
    loggedIn.value = false;
  }
}
