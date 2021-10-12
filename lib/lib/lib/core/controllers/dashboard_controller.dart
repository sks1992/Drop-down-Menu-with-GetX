import 'package:eskool/colors.dart';
import 'package:eskool/core/models/chart_data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController with StateMixin {
  var showStudentCard = false.obs;
  var studentCardVisibility = false.obs;

  late final List<ChartData> attendanceChartData;
  late final List<ChartData> assignmentChartData;

  @override
  void onInit() {
    super.onInit();
    attendanceChartData = [
      ChartData(label: "Attended", value: 75, color: Color(0xFF13D38E)),
      ChartData(label: "Absent", value: 25, color: colorRed)
    ];
    assignmentChartData = [
      ChartData(label: "Completed", value: 36, color: Color(0xFF13D38E)),
      ChartData(label: "Incomplete", value: 25, color: colorRed)
    ];
  }
}
