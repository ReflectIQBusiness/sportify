import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroductionScreenController extends GetxController {
  PageController pageController = PageController();
  RxInt currentPage = 0.obs;
  int duration = 300;
  nextPage() {
    pageController.nextPage(duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    if (currentPage.value < 2) {
      currentPage.value++;
    }
  }

  previousPage() {
    pageController.previousPage(duration: Duration(milliseconds: duration), curve: Curves.easeIn);
    if (currentPage.value > 0) {
      currentPage.value--;
    }
  }
}
