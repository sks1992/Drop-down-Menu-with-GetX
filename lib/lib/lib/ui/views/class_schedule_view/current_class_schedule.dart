import 'package:eskool/core/controllers/class_schedule_controller.dart';
import 'package:eskool/core/models/class_schedule_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/button_with_icon.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/icon_with_text.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurrentClassSchedule extends StatelessWidget {
  const CurrentClassSchedule({Key? key}) : super(key: key);
  final String classType =  "U";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetBuilder<ClassScheduleController>(
        init: Get.put(ClassScheduleController(classType)),
        builder: (_controller) {
          return _controller.obx(
                (_classSchedule) => _classSchedule == null || !_classSchedule.isSuccess
                ? Padding(
              padding: const EdgeInsets.all(16.0),
              child: MessageView(
                  success: false,
                  message: _classSchedule?.message ?? "No data found."),
            )
                : ListView(
              padding: EdgeInsets.all(16),
              children: [..._getCurrentClassSchedule(_classSchedule)],
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
    );
  }
}

List<Widget> _getCurrentClassSchedule(ClassScheduleList classScheduleList) {
  return classScheduleList.list.map((a) {
    return Container(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //sample UI
              Text(a.subject,style: TextStyle(
               fontSize: 18
              ),),
              SizedBox(height: 10,),
              Text("${a.topic}",style: TextStyle(
                color: Colors.grey
              ),),
              SizedBox(height: 5,),

              IconWithText(icon: Icon(Icons.watch_later,
              color: Colors.grey,size: 16,), text: "  ${getFormattedDateTime(a.scheduleDate)}"),
              SizedBox(height: 5,),

              IconWithText(icon: Icon(Icons.hourglass_top,
                color: Colors.grey,size: 16,), text: "  ${a.duration} Min Duration"),
              SizedBox(height: 10,),
              ButtonWithIcon(text: "Join", onPressed: (){}, icon: Icons.meeting_room_outlined)
            ],
          ),
        ),
      ),
    );
  }).toList();
}


