import 'package:eskool/app_route.dart';
import 'package:eskool/colors.dart';
import 'package:eskool/core/models/videos_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/button_with_icon.dart';
import 'package:eskool/ui/widgets/icon_with_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoPlayerView extends StatelessWidget {
  final VideoModel a;
  final String classType;

  VideoPlayerView(this.a, this.classType);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: AppBarView(title: "Play"),
          backgroundColor: colorWhite,
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            children: [
              Card(
                elevation: 7,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //sample UI
                      Text(
                        a.title,
                        style: const TextStyle(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 7,
                      ),

                      IconWithText(
                          icon: const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                            size: 16,
                          ),
                          text: "  ${getFormattedDateTime(a.uploadTimeStamp)}"),
                      const SizedBox(
                        height: 7,
                      ),

                      classType == "GetOnlineActivityClassVideos"
                          ? const SizedBox(
                              height: 1,
                            )
                          : a.subject != ""
                              ? IconWithText(
                                  icon: const Icon(
                                    Icons.error_outline,
                                    color: Colors.grey,
                                    size: 16,
                                  ),
                                  text: a.subject!)
                              : const SizedBox(
                                  height: 1,
                                ),

                      ButtonWithIcon(
                          text: "Back to List",
                          onPressed: () {
                            Get.back();
                            classType == "GetOnlineActivityClassVideos"
                                ?Get.offNamed(RouteNames.generalVideos)
                                :Get.offNamed(RouteNames.academicVideos);
                          },
                          icon: Icons.arrow_back)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
