import 'package:eskool/core/models/assessment_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class AssessmentController extends GetxController with StateMixin<AssessmentList>{
  final _appApi = Get.find<AppApi>();
  var showProgress = false.obs;

  @override
  void onInit() async {
    await _getAssessments();
    super.onInit();
  }

  Future<void> _getAssessments() async {
    showProgress.value = true;
    var _result = await _appApi.getAssessments();
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      change(_result, status: RxStatus.success());
    }
    showProgress.value = false;
  }
}