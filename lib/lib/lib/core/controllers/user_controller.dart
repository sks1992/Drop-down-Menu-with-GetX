import 'package:eskool/core/controllers/auth_controller.dart';
import 'package:eskool/core/models/user_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class UserController extends GetxController with StateMixin {
  final _authController = Get.find<AuthController>();
  final _appApi = Get.find<AppApi>();
  var _userData = UserDataModel().obs;

  UserDataModel get userData => _userData.value;

  @override
  onInit() async {
    await getUserData();
    super.onInit();
  }

  Future<void> getUserData() async {
    var _result = await _appApi.getUserData();
    if (!_result.isSuccess) {
      if (_result.message == "Unauthorized") {
        await _authController.logout();
      }
      else {
        change(null, status: RxStatus.error(_result.message));
      }
      change(null, status: RxStatus.error(_result.message));
    } else {
      _userData.value = _result;
      change(null, status: RxStatus.success());
    }
  }
}
