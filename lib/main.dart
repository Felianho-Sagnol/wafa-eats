// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_background/flutter_background.dart';
import 'package:fooddelivery/app/modules/home/home.dart';
import 'package:fooddelivery/core/bindings/app.binding.dart';
import 'package:fooddelivery/core/themes/app.theme.dart';
import 'package:fooddelivery/core/values/app.color.dart';
import 'package:fooddelivery/routes/routes.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final androidConfig = FlutterBackgroundAndroidConfig(
    notificationTitle: "",
    notificationText: "",
    notificationImportance: AndroidNotificationImportance.Default,
    notificationIcon: AndroidResource(
        name: 'background_icon',
        defType: 'drawable'), // Default is ic_launcher from folder mipmap
  );
  await FlutterBackground.initialize(androidConfig: androidConfig);
  await FlutterBackground.enableBackgroundExecution();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WAFA Eats',
      theme: appTheme(),
      initialBinding: AppBinding(),
      unknownRoute: GetPage(
        name: '/notfound',
        page: () => Home(),
      ),
      initialRoute: '/',
      getPages: routes,
    );
  }
}
