import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sportapplication/constants/routes.dart';
import 'package:sportapplication/views/splash_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(useMaterial3: true),
      getPages: routes,
      home: SplashScreen(),
    );
  }
}
