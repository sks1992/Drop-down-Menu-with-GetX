
import 'package:eskool/core/models/circular_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class CircularController extends GetxController with StateMixin<CircularList> {
  final _apiApi = Get.find<AppApi>();
  var showProgress = false.obs;

  @override
  void onInit() async {
    await _getCirculars();

    super.onInit();
  }

  Future<void> _getCirculars() async {
    showProgress.value = true;
    var _result = await _apiApi.getCirculars();
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      change(_result, status: RxStatus.success());
    }
    showProgress.value = false;
  }
}
