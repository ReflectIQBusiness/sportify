import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/views/forget_page.dart';
import 'package:sportapplication/views/home_page/home_page.dart';
import 'package:sportapplication/views/inscription.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool visible = false.obs;
  showPassword() {
    visible.value = !visible.value;
    visible.refresh();
  }

  goToInscription() {
    Get.toNamed(Inscription.routeName);
  }

  goToForgetPage() {
    Get.toNamed(ForgetPage.routeName);
  }

  goToHomePage() {
    Get.offAllNamed(HomePage.routeName);
  }
}
