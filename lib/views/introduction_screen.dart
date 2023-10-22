import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/controller/introduction_screen_controller.dart';

class IntroductionScreen extends StatelessWidget {
  IntroductionScreen({super.key});
  static const routeName = "/introduction-screen";
  final IntroductionScreenController controller = Get.put(IntroductionScreenController());
  @override
  Widget build(BuildContext context) {
    var styleText = TextStyle(fontSize: Get.width / 25, letterSpacing: 1.2, fontWeight: FontWeight.w600);
    return Scaffold(
        body: Stack(
      children: [createSlides(styleText), createActionButtons()],
    ));
  }

  Widget createActionButtons() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Get.height / 20,
        horizontal: Get.width / 22,
      ),
      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        createSkipButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            createPreviousButton(),
            createDots(),
            createNextButton(),
          ],
        )
      ]),
    );
  }

  Widget createSkipButton() {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
          onPressed: () {
            controller.skip();
          },
          child: const Text(
            'Skip',
            style: TextStyle(color: Colors.black, decoration: TextDecoration.underline),
          )),
    );
  }

  Widget createDots() {
    return Obx(() => Row(
          children: List.generate(
              3,
              (index) => Container(
                    margin: const EdgeInsets.only(right: 5),
                    height: 10,
                    width: 10,
                    decoration:
                        BoxDecoration(color: controller.currentPage.value == index ? Colors.black : Colors.grey, borderRadius: BorderRadius.circular(5)),
                  )),
        ));
  }

  Widget createNextButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )),
        onPressed: () {
          controller.nextPage();
        },
        child: const Text(
          "Next",
          style: TextStyle(color: Colors.white),
        ));
  }

  Widget createPreviousButton() {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.black, width: 1),
            )),
        onPressed: () {
          controller.previousPage();
        },
        child: const Text(
          "Previous",
          style: TextStyle(color: Colors.black),
        ));
  }

  Widget createSlides(TextStyle styleText) {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height / 5,
        left: Get.width / 22,
        right: Get.width / 22,
      ),
      child: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [createFirstSlide(styleText), createSecondSlide(styleText), createThirdSlide(styleText)],
      ),
    );
  }

  Widget createThirdSlide(TextStyle styleText) {
    return Column(
      children: [
        SizedBox(
          width: Get.width / 1.5,
          height: Get.height / 3,
          child: SvgPicture.asset('assets/third.svg'),
        ),
        Text(
          'Join our community of fitness enthusiasts and start your journey to a fitter, healthier you today!',
          textAlign: TextAlign.center,
          style: styleText,
        )
      ],
    );
  }

  Widget createSecondSlide(TextStyle styleText) {
    return Column(
      children: [
        SizedBox(
          width: Get.width / 1.5,
          height: Get.height / 3,
          child: SvgPicture.asset('assets/second.svg'),
        ),
        Text(
          'With our app, you can easily track your sports activities, monitor your progress, and stay motivated to lead a healthier lifestyle.',
          textAlign: TextAlign.center,
          style: styleText,
        )
      ],
    );
  }

  Widget createFirstSlide(TextStyle styleText) {
    return Column(
      children: [
        SizedBox(
          width: Get.width / 1.5,
          height: Get.height / 3,
          child: SvgPicture.asset('assets/first.svg'),
        ),
        Text(
          'Welcome to our sports tracking app, your ultimate companion for staying active and achieving your fitness goals',
          textAlign: TextAlign.center,
          style: styleText,
        )
      ],
    );
  }
}
