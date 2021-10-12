import 'package:eskool/core/controllers/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../colors.dart';

class StudentInfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: Get.put(UserController()),
      builder: (UserController _userController) {
        return InkWell(
          onTap: () {
          },
          child: Card(
            elevation: 0,
            color: colorDarkGold.withOpacity(0.1),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: colorRed,
                    child: Icon(
                      CupertinoIcons.person,
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
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "${_userController.userData.code} | ${_userController.userData.syllabus}-${_userController.userData.grade}-${_userController.userData.section}",
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

  }
}
