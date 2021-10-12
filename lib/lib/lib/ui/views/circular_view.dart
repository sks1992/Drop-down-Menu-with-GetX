import 'package:eskool/core/controllers/circulars_controller.dart';
import 'package:eskool/core/models/circular_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/button_with_icon.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:eskool/ui/widgets/theme_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';

class CircularView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: "Circulars"),
        backgroundColor: colorWhite,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GetBuilder<CircularController>(
          init: Get.put(CircularController()),
          builder: (_controller) {
            return _controller.obx(
              (_circulars) => _circulars == null || !_circulars.isSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MessageView(
                          success: false,
                          message: _circulars?.message ?? "No data found"),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [..._getCircularWidgets(_circulars)],
                    ),
              onLoading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: const DotProgressIndicator()),
              ),
              onError: (err) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MessageView(success: false, message: err ?? ""),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  List<Widget> _getCircularWidgets(CircularList circulars) {
    return circulars.list.map((a) {
      return Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //sample UI
              DescriptionText(
                a.circularName,
                textColor: Colors.black87,
              ),
              const SizedBox(height: 4.0),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_outlined,
                    color: Colors.grey,
                    size: 16,
                  ),
                  const SizedBox(width: 8.0),
                  DescriptionText(
                    getFormattedDate(a.uploadDate),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              ThemeButtonSmall(text: "Download", onPressed: () {})
            ],
          ),
        ),
      );
    }).toList();
  }
}
