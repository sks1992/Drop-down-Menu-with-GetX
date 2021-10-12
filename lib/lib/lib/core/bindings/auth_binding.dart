import 'package:eskool/core/controllers/auth_controller.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:eskool/core/services/authentication_service.dart';
import 'package:eskool/core/services/identity_api.dart';
import 'package:eskool/core/services/shared_service.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SharedService>(SharedService());
    Get.put<IdentityApi>(IdentityApi(), permanent: true);
    Get.put<AuthenticationService>(AuthenticationService());
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<AppApi>(AppApi(), permanent: true);
    //Get.put<AppApiFileDownloadService>(AppApiFileDownloadService());
  }
}