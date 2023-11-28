import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/splash_screen_controller.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});
  static const routeName = "/splash-screen";
  final SplashScreenController controller = Get.put(SplashScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Obx(
      () => AnimatedScale(
        duration: const Duration(seconds: 1),
        scale: controller.scale.value.toDouble(),
        child: Center(
          child: Image.asset("assets/logo.png"),
        ),
      ),
    ));
  }
}
