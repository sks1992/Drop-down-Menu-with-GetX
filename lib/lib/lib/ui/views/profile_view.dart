import 'package:eskool/colors.dart';
import 'package:eskool/core/controllers/profile_controller.dart';
import 'package:eskool/core/models/profile_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/description.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:eskool/ui/widgets/message_with_icon_row.dart';
import 'package:eskool/ui/widgets/title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: "Profile"),
        backgroundColor: colorWhite,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GetBuilder<ProfileController>(
          init: Get.put(ProfileController()),
          builder: (_controller) {
            return _controller.obx(
              (_profile) => _profile == null || !_profile.isSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MessageView(
                          success: false,
                          message: _profile?.message ?? "No data found"),
                    )
                  : ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        _getProfileStudentWidgets(_profile),
                      ],
                    ),
              onLoading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: const DotProgressIndicator()),
              ),
              onError: (err) => Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: MessageView(success: false, message: err ?? ""),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _getProfileStudentWidgets(ProfileList profileList) {
    if (profileList.student == null) {
      return SizedBox.shrink();
    }
    return Column(
      children: [
        Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(255, 190, 150, 1),
                      Color.fromRGBO(254, 124, 150, 1),
                    ])),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageIconRow("${profileList.student!.name}", Icons.person),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Gender",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText(
                    profileList.student!.gender == 1 ? "Male" : "Female",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Date Of Birth",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${getFormattedDate(profileList.student!.dob)}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Blood Group",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.student!.bloodGroup}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Mobile",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.student!.mobile}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Email",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.student!.email}",
                    textColor: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(141, 201, 249, 1),
                      Color.fromRGBO(25, 138, 227, 1),
                    ])),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MessageIconRow("${profileList.student!.school}", Icons.school),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Student Code",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText(profileList.student!.code,
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Grade",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText(profileList.student!.grade,
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Section",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.student!.section}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Syllabus",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.student!.syllabus}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Academic Year",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.student!.academicYear}",
                    textColor: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(131, 217, 210, 1),
                      Color.fromRGBO(30, 208, 131, 1)
                    ])),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DescriptionText("Parents",
                        fontSize: 20.0, textColor: Colors.white),
                    Icon(
                      Icons.supervised_user_circle,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Father",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText(profileList.parents![0].name,
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Mobile",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.parents![0].mobile}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Email",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.parents![0].email}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Mother",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.parents![1].name}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Mobile",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.parents![1].mobile}",
                    textColor: Colors.white),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 16.0,
        ),
        Card(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [Colors.purple.shade300, Colors.deepPurpleAccent])),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DescriptionText("Address",
                        fontSize: 20.0, textColor: Colors.white),
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.white,
                    )
                  ],
                ),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "House No.",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText(profileList.address!.houseNo,
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Street",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText(profileList.address!.street,
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Mandal",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.address!.mandal}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "City",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.address!.city}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "District",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.address!.district}",
                    textColor: Colors.white),
                const SizedBox(height: 16.0),
                DescriptionText(
                  "Pin Code",
                  fontSize: 14,
                ),
                const SizedBox(height: 4.0),
                DescriptionText("${profileList.address!.pincode}",
                    textColor: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
