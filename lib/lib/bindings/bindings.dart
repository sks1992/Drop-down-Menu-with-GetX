import 'package:get/get.dart';
import 'package:sample_login/network/identity.dart';
import 'package:sample_login/services/authentication_service.dart';

import '../controllers/auth_controller.dart';

class InitBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<Identity>(Identity(), permanent: true);
    Get.put<AuthenticationService>(AuthenticationService());
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
