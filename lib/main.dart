import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sportapplication/constants/routes.dart';
import 'package:sportapplication/views/home_page/home_page.dart';
import 'package:sportapplication/views/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: Get.width / 15,
            letterSpacing: 2,
          ),
          headlineMedium: TextStyle(
            fontSize: Get.width / 20,
            letterSpacing: 2,
          ),
        ),
      ),
      getPages: routes,
      home: SplashScreen(),
    );
  }
}
