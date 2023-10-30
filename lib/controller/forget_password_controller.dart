import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  RxString method = "email".obs;
  TextEditingController contactController = TextEditingController();

  changeMethod() {
    method.value = method.value == "email" ? "phone" : "email";
    method.refresh();
  }
}
