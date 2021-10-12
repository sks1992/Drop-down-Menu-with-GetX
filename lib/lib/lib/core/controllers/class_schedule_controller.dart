import 'package:eskool/core/models/class_schedule_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class ClassScheduleController extends GetxController
    with StateMixin<ClassScheduleList> {
  final _appApi = Get.find<AppApi>();
  var showProgress = false.obs;
  final String classType;

  ClassScheduleController(this.classType);

  @override
  void onInit() async {
    await _getClassSchedule();
    super.onInit();
  }

  Future<void> _getClassSchedule() async {
    showProgress.value = true;
    var _result = await _appApi.getClassSchedule(classType);
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      change(_result, status: RxStatus.success());
    }
    showProgress.value = false;
  }
}
