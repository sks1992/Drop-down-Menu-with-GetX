import 'dart:ui';

import 'package:eskool/colors.dart';
import 'package:eskool/core/controllers/auth_controller.dart';
import 'package:eskool/core/controllers/user_controller.dart';
import 'package:eskool/ui/widgets/list_expansion_tile.dart';
import 'package:eskool/ui/widgets/list_tile_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app_route.dart';

class NavDrawer extends StatelessWidget {
  final _authController = Get.find<AuthController>();
  final _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            child: DrawerHeader(
              margin: EdgeInsets.all(0),
              decoration: BoxDecoration(color: colorWhite),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: colorRed,
                    child: Icon(
                      Icons.person_outline,
                      color: colorWhite,
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _userController.userData.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "${_userController.userData.code} | ${_userController.userData.syllabus}-${_userController.userData.grade}-${_userController.userData.section}",
                        style: TextStyle(
                            fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          ListTileDrawer(
            text: 'Profile',
            onTap: () {
              Get.back();
              //Get.toNamed(ProfileScreen.id);
            },
            iconLeading: Icons.person_outline,
          ),
          ListTileDrawer(
            text: 'Class Schedules',
            onTap: () {
              Get.back();
              Get.toNamed(RouteNames.classSchedule);
            },
            iconLeading: Icons.schedule_outlined,
          ),
          ListTileDrawer(
            text: 'Assignments',
            onTap: () {
              Get.back();
              //Get.toNamed(AssignmentScreen.id);
            },
            iconLeading: Icons.assignment_outlined,
          ),
          ListExpandedTileView(
            title: 'Assessments',
            iconLeading: Icons.assessment_outlined,
            expansionListTile: Column(
              children: [
                ListTileDrawer(
                  tileColor: backgroundColor,
                  iconLeading: Icons.arrow_forward,
                  text: 'Assessments',
                  onTap: () {
                    Get.back();
                    Get.toNamed(RouteNames.assessments);
                  },
                ),
                ListTileDrawer(
                  tileColor: backgroundColor,
                  iconLeading: Icons.arrow_forward,
                  text: 'Computer Based Test',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          ListExpandedTileView(
            title: 'Video Library',
            iconLeading: Icons.video_collection,
            expansionListTile: Column(
              children: [
                ListTileDrawer(
                  tileColor: backgroundColor,
                  iconLeading: Icons.arrow_forward,
                  text: 'Genral Videos',
                  onTap: () {
                    Get.back();
                    //Get.toNamed(VideoScreen.id);
                  },
                ),
                ListTileDrawer(
                  tileColor: backgroundColor,
                  iconLeading: Icons.arrow_forward,
                  text: 'Academic Videos',
                  onTap: () {
                    Get.back();
                  },
                ),
              ],
            ),
          ),
          ListTileDrawer(
            text: 'Report Card',
            onTap: () {
              Get.back();
            },
            iconLeading: Icons.multiline_chart_outlined,
          ),
          ListTileDrawer(
            text: 'Fee Receipts',
            onTap: () {
              Get.back();
              Get.toNamed(RouteNames.feeReceipts);
            },
            iconLeading: Icons.receipt,
          ),
          ListTileDrawer(
            text: 'Contact',
            onTap: () {
              Get.back();
              Get.toNamed(RouteNames.contact);
            },
            iconLeading: Icons.phone_outlined,
          ),
          ListTileDrawer(
            text: 'Logout',
            onTap: () async {
              await _authController.logout();
            },
            iconLeading: Icons.power_settings_new,
          ),
        ],
      ),
    );
  }
}
