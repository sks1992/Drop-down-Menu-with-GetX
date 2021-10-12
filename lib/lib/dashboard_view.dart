import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';

class DashboardView extends StatelessWidget {
  DashboardView({Key? key}) : super(key: key);

  final _authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Dashboard"),
        elevation: 0,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const Text("You are now logged in."),
            ElevatedButton(
              child: const Text("LOGOUT"),
              onPressed: () {
                _authController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
