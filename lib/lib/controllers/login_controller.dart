import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_login/models/constants.dart';
import 'package:sample_login/services/authentication_service.dart';

import 'auth_controller.dart';

class LoginController extends GetxController with StateMixin {
  final _authController = Get.find<AuthController>();
  final _authService = Get.find<AuthenticationService>();

  var showProgress = false.obs;

  //for mobile number text
  TextEditingController mobileController = TextEditingController();

  //for password text
  TextEditingController verifyCodeController = TextEditingController();

  FocusNode verifyCodeFocusNode = FocusNode();

  Future login() async {
    change(null, status: RxStatus.success());
    //check all input validations before calling the below function
    showProgress.value = true;
    var _result = await _authService.authenticateUser(
        "9000000000", "333333", Constants.pinLogin);
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      _authController.loggedIn.value = true;
    }
    showProgress.value = false;
  }

  @override
  void onClose() {
    mobileController.dispose();
    verifyCodeController.dispose();
    verifyCodeFocusNode.dispose();
    super.onClose();
  }
}
