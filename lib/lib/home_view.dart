import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/auth_controller.dart';
import 'controllers/login_controller.dart';
import 'dashboard_view.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final loginController = Get.put(LoginController());
  final authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.greenAccent,
        elevation: 0.0,
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            fit: FlexFit.tight,
            child: ListView(
              children: <Widget>[
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/logo.png",
                        width: 120,
                        height: 120,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 32,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Mobile Number",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            TextFormField(
                              autocorrect: false,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              cursorColor: Colors.red,
                              controller: loginController.mobileController,
                              onFieldSubmitted: (String value) {
                                /*FocusScope.of(context)
                                    .requestFocus(_verifyCodeFocusNode);*/
                              },
                              decoration: const InputDecoration(
                                  hintText: "Please enter your mobile number"),
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              "PIN",
                              style: TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                            TextFormField(
                                obscureText: true,
                                maxLength: 6,
                                autocorrect: false,
                                maxLines: 1,
                                keyboardType: TextInputType.number,
                                cursorColor: Colors.red,
                                controller:
                                    loginController.verifyCodeController,
                                focusNode: loginController.verifyCodeFocusNode,
                                decoration: const InputDecoration(
                                    hintText: "Please enter PIN")),
                            Center(
                              child: ElevatedButton(
                                  child: const Text(
                                    "   Login   ",
                                    style: TextStyle(color: Colors.black45),
                                  ),
                                  onPressed: () {
                                    loginController.login();
                                   /* Get.back();
                                    Get.to(()=>DashboardView());
                                    authController.loggedIn.value =true;*/
                                  }),
                            ),
                            Obx(() => loginController.showProgress.value
                                ? const Center(child: CircularProgressIndicator())
                                : SizedBox.fromSize()),
                            loginController.obx(
                                  (state) => SizedBox.fromSize(),
                              onLoading: SizedBox.fromSize(),
                              onError: (err) => Text(err ?? "Login failed"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
