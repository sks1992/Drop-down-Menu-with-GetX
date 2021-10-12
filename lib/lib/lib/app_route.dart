import 'package:eskool/ui/views/assessments_view.dart';
import 'package:eskool/ui/views/circular_view.dart';
import 'package:eskool/ui/views/class_schedule_view/class_schedule_view.dart';
import 'package:eskool/ui/views/contact_view.dart';
import 'package:eskool/ui/views/fee_receipt_view.dart';
import 'package:eskool/ui/views/login_view.dart';
import 'package:eskool/ui/views/main_view.dart';
import 'package:eskool/ui/views/profile_view.dart';
import 'package:eskool/ui/views/video_view/academic_videos_view.dart';
import 'package:eskool/ui/views/video_view/general_videos_view.dart';
import 'package:get/get.dart';

import 'ui/views/splash_view.dart';

class RouteNames {
  static String splash = "/splash";
  static String login = "/login";
  static String dashboard = "/dashboard";
  static String contact = "/contact";

  static String profile = "/profile";
  static String classSchedule = "/classSchedule";
  static String assignments = "/assignments";
  static String assessments = "/assessments";
  static String cbt = "/cbt";
  static String generalVideos = "/generalVideos";
  static String academicVideos = "/academicVideos";
  static String reportCard = "/reportCard";
  static String feeReceipts = "/feeReceipts";
  static String circulars = "/circulars";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: RouteNames.login,
      page: () => LoginView(),
    ),
    GetPage(
      name: RouteNames.contact,
      page: () => ContactView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.dashboard,
      page: () => MainView(),
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => ProfileView(),
    ),
    GetPage(
      name: RouteNames.assessments,
      page: () => AssessmentsView(),
      transition: Transition.cupertino,
    ),
    GetPage(
      name: RouteNames.feeReceipts,
      page: () => FeeReceiptView(),
    ),
    GetPage(
      name: RouteNames.classSchedule,
      page: () => ClassScheduleView(),
    ),
    GetPage(
      name: RouteNames.circulars,
      page: () => CircularView(),
    ),
    GetPage(
      name: RouteNames.profile,
      page: () => ProfileView(),
    ),
    GetPage(
      name: RouteNames.generalVideos,
      page: () => GeneralVideosView(),
    ),
    GetPage(
      name: RouteNames.academicVideos,
      page: () => AcademicVideosView(),
    ),
  ];
}
