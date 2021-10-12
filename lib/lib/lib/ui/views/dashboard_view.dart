import 'package:eskool/core/controllers/dashboard_controller.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/dashboard_list_item.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:eskool/ui/widgets/pie_chart_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../app_route.dart';
import '../../colors.dart';

class DashboardView extends StatelessWidget {
  final _dashboardController = Get.put(DashboardController());

  @override
  Widget build(BuildContext context) {
    print("DashboradView build called.");
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: "Dashboard", childPage: false),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptionText("Live Class Attendance",
                              textColor: colorRed),
                          DescriptionText("This year", fontSize: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: PieChartCard(
                        chartData: _dashboardController.attendanceChartData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptionText("Class Schedules",
                              textColor: colorRed),
                          DescriptionText("Today, Monday, 27 Sep",
                              fontSize: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DashboardListItem(
                      title: "Science",
                      subTitle: "01:30 PM-02:30 PM",
                      buttonText: "JOIN",
                      onButtonPressed: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DashboardListItem(
                      title: "Mathematics",
                      subTitle: "02:30 PM-03:15 PM",
                      buttonText: "JOIN",
                      onButtonPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptionText("Assignments", textColor: colorRed),
                          DescriptionText("in the last 30 days", fontSize: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: PieChartCard(
                        chartData: _dashboardController.assignmentChartData,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            Card(
              elevation: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(RouteNames.circulars);
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DescriptionText("Circulars", textColor: colorRed),
                          DescriptionText("This year", fontSize: 12),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DashboardListItem(
                      title: "20 Jun 2021",
                      subTitle: "Exams Circulars",
                      buttonText: "Download",
                      onButtonPressed: () {},
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    DashboardListItem(
                      title: "19 Jun 2021",
                      subTitle: "Test Circular for Grade III",
                      buttonText: "Download",
                      onButtonPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
