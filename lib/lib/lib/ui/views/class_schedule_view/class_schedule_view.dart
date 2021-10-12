import 'package:eskool/ui/views/class_schedule_view/ended_class_schedule.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'current_class_schedule.dart';

class ClassScheduleView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: AppBarView(
            title: "Class Schedule",
          ),
          bottom: TabBar(
            indicator: BoxDecoration(color: Colors.deepPurple[400]),
            tabs: [
              Tab(
                text: "Current",
              ),
              Tab(text: 'Ended')
            ],
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [CurrentClassSchedule(), EndedClassSchedule()],
          ),
        ),
      ),
    );
  }
}
