import 'package:eskool/colors.dart';
import 'package:eskool/core/controllers/auth_controller.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_route.dart';

class MoreMenuView extends StatelessWidget {
  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    print("MoreMenuView build called.");
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 8, right: 8, bottom: 4, left: 8),
              child: DescriptionText("ACADEMICS",
                  fontSize: 14, textColor: Colors.black87),
            ),
            _listTile(
              'Class Schedules',
              () {
                Get.toNamed(RouteNames.classSchedule);
              },
            ),
            SizedBox(height: 1),
            _listTile(
              'Assignments',
              () {
                //Get.toNamed(AssignmentScreen.id);
              },
            ),
            SizedBox(height: 1),
            _listTile(
              'Assessments',
              () {
                Get.toNamed(RouteNames.assessments);
              },
            ),
            SizedBox(height: 1),
            _listTile(
              'Computer Based Test',
              () {
                //Get.toNamed(AssignmentScreen.id);
              },
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 16, right: 8, bottom: 4, left: 8),
              child: DescriptionText("VIDEO LIBRARY",
                  fontSize: 14, textColor: Colors.black87),
            ),
            _listTile(
              'General Videos',
              () {
                Get.toNamed(RouteNames.generalVideos);
              },
            ),
            SizedBox(height: 1),
            _listTile(
              'Academic Videos',
              () {
                Get.toNamed(RouteNames.academicVideos);
              },
            ),
            SizedBox(height: 24),
            _listTile(
              'Report Card',
              () {
                //Get.toNamed(AssignmentScreen.id);
              },
            ),
            SizedBox(height: 1),
            _listTile(
              'Fee Receipts',
              () {
                Get.toNamed(RouteNames.feeReceipts);
              },
            ),
            SizedBox(height: 24),
            _listTile(
              'Contact Us',
              () {
                Get.toNamed(RouteNames.contact);
              },
            ),
            SizedBox(height: 1),
            _listTile(
              'Logout',
              () async {
                await _authController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile(String text, VoidCallback onTap) {
    return ListTile(
      dense: true,
      tileColor: colorWhite,
      title: Text(
        text,
        style: TextStyle(color: Colors.black54),
      ),
      onTap: onTap,
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 12,
      ),
    );
  }
}
