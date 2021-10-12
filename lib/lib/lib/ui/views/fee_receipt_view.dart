import 'package:eskool/core/controllers/fee_receipts_controller.dart';
import 'package:eskool/core/models/fee_receipts_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/button_with_icon.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/icon_with_text.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FeeReceiptView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(
          title: "Fee Receipts",
        ),
      ),
      body: SafeArea(
        child: GetBuilder<FeeReceiptsController>(
          init: Get.put(FeeReceiptsController()),
          builder: (_controller) {
            return _controller.obx(
              (_feeReceipts) => _feeReceipts == null || !_feeReceipts.isSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MessageView(
                          success: false,
                          message: _feeReceipts?.message ?? "No data found."),
                    )
                  : ListView(
                      padding: EdgeInsets.all(16),
                      children: [..._getFeeReceiptWidgets(_feeReceipts)],
                    ),
              onLoading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: const DotProgressIndicator()),
              ),
              onError: (err) => Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MessageView(success: false, message: err ?? ""),
              )),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getFeeReceiptWidgets(FeeReceiptList feeReceipts) {
    return feeReceipts.list.map((a) {
      return Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DescriptionText(
                "${getFormattedDate(a.collectionDate)}",
                textColor: Colors.black87,
              ),
              SizedBox(
                height: 8,
              ),
              DescriptionText(
                getFormattedAmount(a.amount.toDouble()),
              ),
              SizedBox(
                height: 8,
              ),
              IconWithText(
                  icon: Icon(
                    Icons.receipt,
                    size: 14,
                    color: Colors.grey,
                  ),
                  text: "  ${a.receiptNo}"),
              SizedBox(
                height: 8,
              ),
              IconWithText(
                  icon: Icon(
                    Icons.account_balance_outlined,
                    size: 15,
                    color: Colors.grey,
                  ),
                  text: "  ${a.paymentType}"),
              SizedBox(
                height: 8,
              ),
              ButtonWithIcon(
                  text: "Download Receipt",
                  onPressed: () {},
                  icon: Icons.download),
            ],
          ),
        ),
      );
    }).toList();
  }
}
