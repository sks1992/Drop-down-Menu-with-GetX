import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_route.dart';
import 'colors.dart';
import 'core/bindings/auth_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      systemNavigationBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(EskoolApp());
}

class EskoolApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'eSkool',
      getPages: AppRoute.route,
      initialRoute: RouteNames.splash,
      initialBinding: AuthBinding(),
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorBrightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: primarySwatchColor)
            .copyWith(secondary: accentColor),
        appBarTheme: AppBarTheme(
          backgroundColor: colorWhite,
          foregroundColor: Colors.black54,
          elevation: 0.0,
        ),
        fontFamily: 'Ubuntu',
      ),
    );
  }
}
