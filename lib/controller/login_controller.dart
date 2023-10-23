import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
}
