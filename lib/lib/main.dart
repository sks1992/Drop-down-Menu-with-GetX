import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'app_route.dart';
import 'bindings/bindings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      // transparent status bar
      // navigation bar color
      statusBarIconBrightness: Brightness.dark,
      // status bar icons' color
      systemNavigationBarIconBrightness:
      Brightness.light, //navigation bar icons' color
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      enableLog: true,
      debugShowCheckedModeBanner: false,
      title: 'Samples',
      initialBinding: InitBinding(),
      getPages: AppRoute.route,
      initialRoute: RouteNames.home,
      theme: ThemeData(
        primaryColor: Colors.blue,
        primaryColorBrightness: Brightness.dark,
      ),
    );
  }
}
