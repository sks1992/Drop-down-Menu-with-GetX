import 'package:eskool/core/models/fee_receipts_model.dart';
import 'package:eskool/core/services/app_api.dart';
import 'package:get/get.dart';

class FeeReceiptsController extends GetxController with StateMixin<FeeReceiptList> {
  final _appApi = Get.find<AppApi>();
  var showProgress = false.obs;

  @override
  void onInit() async {
    await _getFeeReceipts();
    super.onInit();
  }

  Future<void> _getFeeReceipts() async {
    showProgress.value = true;
    var _result = await _appApi.getFeeReceipt();
    if (!_result.isSuccess) {
      change(null, status: RxStatus.error(_result.message));
    } else {
      change(_result, status: RxStatus.success());
    }
    showProgress.value = false;
  }
}
