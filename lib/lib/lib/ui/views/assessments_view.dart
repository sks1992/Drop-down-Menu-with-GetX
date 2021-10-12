import 'package:eskool/core/controllers/assessment_controller.dart';
import 'package:eskool/core/models/assessment_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';

class AssessmentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: "Assessments"),
      ),
      body: SafeArea(
        child: GetBuilder(
          init: Get.put(AssessmentController()),
          builder: (AssessmentController _controller) {
            return _controller.obx(
              (_assessments) => _assessments == null || !_assessments.isSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MessageView(
                          success: false,
                          message: _assessments?.message ?? "No data found."),
                    )
                  : ListView(
                      padding: EdgeInsets.all(16),
                      children: [..._getAssessmentWidgets(_assessments)],
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

  List<Widget> _getAssessmentWidgets(AssessmentList assessments) {
    return assessments.list.map((a) {
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              //sample UI
              Text(a.assignmentName),
              Text("Assessment Date: ${getFormattedDate(a.assignmentDate)}"),
              Text("Assessment Time: ${a.timeSlot}"),
            ],
          ),
        ),
      );
    }).toList();
  }
}
