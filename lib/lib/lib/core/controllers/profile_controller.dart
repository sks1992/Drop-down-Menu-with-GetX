import 'package:eskool/core/models/profile_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController with StateMixin<ProfileList> {
  final _apiApi = Get.find<AppApi>();
  var showProgress = false.obs;

  @override
  void onInit() async {
    await _getProfile();
    super.onInit();
  }

  Future<void> _getProfile() async {
    showProgress.value = true;
    var _result = await _apiApi.getProfile();
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      change(_result, status: RxStatus.success());
    }
    showProgress.value = false;
  }
}
