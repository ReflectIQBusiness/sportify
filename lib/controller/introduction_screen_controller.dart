import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/views/login.dart';

class IntroductionScreenController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  int duration = 300;
  nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    if (currentPage.value < 2) {
      currentPage.value++;
    } else {
      Get.offAllNamed(Login.routeName);
    }
  }

  previousPage() {
    pageController.previousPage(duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }

  skip() {
    Get.offAllNamed(Login.routeName);
  }
}
