import 'dart:ui';

import 'package:eskool/app_route.dart';
import 'package:eskool/colors.dart';
import 'package:eskool/core/constants.dart';
import 'package:eskool/core/controllers/login_controller.dart';
import 'package:eskool/ui/widgets/button.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  final _controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: Get.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Color(0XFFace9fe),
              Colors.white,
            ],
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 32),
              Center(
                child: Image.asset("assets/reqelford.png",
                    height: 150, fit: BoxFit.cover),
              ),
              const SizedBox(height: 16),
              Column(
                children: [
                  Button(
                    "LOGIN",
                        () async {
                      await _controller.login();
                    },
                  ),
                  Button(
                    "CONTACT",
                        () {
                      Get.toNamed(RouteNames.contact);
                    },
                    backgroundColor: colorRed,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 10),
                  _controller.obx(
                    (state) => MessageView(
                      success: true,
                      message: state ?? "",
                    ),
                    onLoading: const SizedBox(height: 0),
                    onError: (err) => MessageView(
                      success: false,
                      message: err,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Image.asset("assets/rfis_building.jpg", fit: BoxFit.cover),
                  Container(
                    color: Color(0XFFdcc8a5),
                    height: 40,
                    width: Get.width,
                    child: const SizedBox()
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  Widget _textField(
    IconData iconData,
    String label,
    TextEditingController? controller, {
    bool obscureText = false,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      autocorrect: false,
      decoration: InputDecoration(
        prefixIcon: Icon(
          iconData,
          color: Colors.orange,
        ),
        labelText: label,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        enabledBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: Colors.grey, width: 0.0),
        ),
        focusedBorder: const OutlineInputBorder(
          // width: 0.0 produces a thin "hairline" border
          borderSide: const BorderSide(color: colorPurple, width: 0.8),
        ),
      ),
    );
  }
}
