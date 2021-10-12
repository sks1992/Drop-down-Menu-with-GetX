import 'package:eskool/core/services/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'auth_controller.dart';

class LoginController extends GetxController with StateMixin {
  final _authController = Get.find<AuthController>();
  final _authService = Get.find<AuthenticationService>();

  @override
  void onClose() {
    super.onClose();
  }

  Future login() async {
    var _result = await _authService.authenticateUser();
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      _authController.loggedIn.value = true;
    }
  }
}
