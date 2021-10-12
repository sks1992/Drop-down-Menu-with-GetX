import 'package:get/get.dart';

import 'dashboard_view.dart';
import 'home_view.dart';
import 'splash_view.dart';

class RouteNames {
  static String splash = "/splash";
  static String home = "/home";
  static String dashboard = "/dashboard";
}

class AppRoute {
  static final route = [
    GetPage(
      name: RouteNames.splash,
      page: () => SplashView(),
    ),
    GetPage(
      name: RouteNames.home,
      page: () => HomeView(),
    ),
    GetPage(
      name: RouteNames.dashboard,
      page: () => DashboardView(),
    ),
  ];
}
