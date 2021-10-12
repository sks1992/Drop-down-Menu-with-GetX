import 'package:drop_down_menu_with_getx/sample_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dropdown.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Sample"),
        elevation: 0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: GetBuilder<SampleController>(
              init: Get.put(SampleController()),
              builder: (_controller) {
                return Column(
                  children: [
                    Obx(
                      () => _controller.states.isNotEmpty
                          ? DropDown(
                              value: _controller.stateDropDownValue.value,
                              items: _controller.states,
                              onChanged: (String val) {
                                if (val == 0.toString()) {
                                } else {
                                  _controller.stateDropDownValue.value = val;
                                  _controller.setDistricts(val);
                                }
                              },
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(height: 8.0),
                    Obx(
                      () => _controller.districts.isNotEmpty
                          ? DropDown(
                              value: _controller.districtDropDownValue.value,
                              items: _controller.districts,
                              onChanged: (String val) {
                                if (val == 0.toString()) {
                                } else {
                                  _controller.districtDropDownValue.value = val;
                                  _controller.setBranches(val);
                                }
                              },
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(height: 8.0),
                    Obx(
                      () => _controller.branches != null &&
                              _controller.branches!.isNotEmpty
                          ? DropDown(
                              value: _controller.branchDropDownValue.value,
                              items: _controller.branches!,
                              onChanged: (String val) {
                                if (val == 0.toString()) {
                                } else {
                                  _controller.branchDropDownValue.value = val;
                                  _controller.setBranchAddress(val);
                                }
                              },
                            )
                          : const SizedBox(),
                    ),
                    const SizedBox(height: 8.0),
                    Obx(
                      () => _controller.selectedBranchAddress.isNotEmpty &&
                              _controller.branches != null
                          ? Text(
                              "Address: \n ${_controller.selectedBranchAddress}")
                          : const SizedBox(),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
