import 'package:eskool/colors.dart';
import 'package:eskool/core/controllers/videos_controller.dart';
import 'package:eskool/core/models/videos_model.dart';
import 'package:eskool/ui/shared/formats.dart';
import 'package:eskool/ui/views/video_view/video_player_view.dart';
import 'package:eskool/ui/widgets/app_bar.dart';
import 'package:eskool/ui/widgets/button_with_icon.dart';
import 'package:eskool/ui/widgets/dot_progress_indicator.dart';
import 'package:eskool/ui/widgets/icon_with_text.dart';
import 'package:eskool/ui/widgets/message_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GeneralVideosView extends StatelessWidget {
  const GeneralVideosView({Key? key}) : super(key: key);

  final String classType = "GetOnlineActivityClassVideos";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppBarView(title: "General Videos"),
        backgroundColor: colorWhite,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: GetBuilder<VideosController>(
          init: Get.put(VideosController(classType)),
          builder: (_controller) {
            return _controller.obx(
              (_videos) => _videos == null || !_videos.isSuccess
                  ? Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: MessageView(
                          success: false,
                          message: _videos?.message ?? "No data found."),
                    )
                  : ListView(
                      padding: EdgeInsets.all(16),
                      children: [..._getGeneralVideos(_videos,classType)],
                    ),
              onLoading: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(child: const DotProgressIndicator()),
              ),
              onError: (err) => Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: MessageView(success: false, message: err ?? ""),
              )),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> _getGeneralVideos(VideoList videoList,String classType ) {
  return videoList.list.map((a) {
    return Card(
      child: Padding(
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

            a.description != ""
                ? IconWithText(
                    icon: const Icon(
                      Icons.error_outline,
                      color: Colors.grey,
                      size: 16,
                    ),
                    text: a.description!)
                : const SizedBox(
                    height: 1,
                  ),
            ButtonWithIcon(
                text: "Watch Video",
                onPressed: () {
                  Get.to(() => VideoPlayerView(a,classType));
                },
                icon: Icons.play_circle_fill)
          ],
        ),
      ),
    );
  }).toList();
}
