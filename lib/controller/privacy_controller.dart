import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PrivacyController extends GetxController {
  var isPrivacy = true.obs;
  var isTerms = false.obs;
  Rx<ScrollController> scrollController = ScrollController().obs;
  RxDouble percentScroll = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    scrollController.value.addListener(() {
      double currentProgressValue = scrollController.value.offset / scrollController.value.position.maxScrollExtent;

      if (currentProgressValue < 0.0) {
        currentProgressValue = 0.0;
      }

      if (currentProgressValue > 1.0) {
        currentProgressValue = 1.0;
      }

      percentScroll.value = currentProgressValue;
      percentScroll.refresh();
    });
  }

  void changePrivacy() {
    resetScroll();
    isPrivacy.value = true;
    isTerms.value = false;
    isPrivacy.refresh();
    isTerms.refresh();
  }

  void changeTerms() {
    resetScroll();
    isPrivacy.value = false;
    isTerms.value = true;
    isPrivacy.refresh();
    isTerms.refresh();
  }

  resetScroll() {
    scrollController.value.animateTo(
      0.0,
      duration: Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    scrollController.refresh();
    percentScroll.value = 0.0;
    percentScroll.refresh();
  }
}
