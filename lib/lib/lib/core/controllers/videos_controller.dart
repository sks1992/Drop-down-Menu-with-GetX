import 'package:eskool/core/models/videos_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class VideosController extends GetxController with StateMixin<VideoList> {
  final _apiApi = Get.find<AppApi>();
  var showProgress = false.obs;
  final String classType;

  VideosController(this.classType);

  @override
  void onInit() async {
    await _getVideos();

    super.onInit();
  }

  Future<void> _getVideos() async {
    showProgress.value = true;
    var _result = await _apiApi.getVideo(classType);
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      change(_result, status: RxStatus.success());
    }
    showProgress.value = false;
  }
}