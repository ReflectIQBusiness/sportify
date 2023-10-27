import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/complete_profile_informations_controller.dart';

class ChooseProfilePic extends StatelessWidget {
  ChooseProfilePic({super.key});
  static const routeName = "/choose-profile-pic";
  final CompleteProfileinformations controller = CompleteProfileinformations();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        createSkipButton(),
        createTitleAndSubTitle(),
        createChoosePicture(context),
        createContinuButton(),
      ],
    ));
  }

  Widget createContinuButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: Get.width / 20, horizontal: Get.width / 20),
      child: ElevatedButton(
        onPressed: () {
          controller.changePicture();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: Size(Get.width, 50),
          backgroundColor: orangeCustom,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Continue",
          style: TextStyle(color: Colors.white, fontSize: Get.width / 20),
        ),
      ),
    );
  }

  Widget createChoosePicture(BuildContext context) {
    return Expanded(
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Obx(
                () => controller.imageFile.value.path != "" ? choosePictureIfNotNull(context) : choosePictureIfNull(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget choosePictureIfNotNull(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: Get.width / 4.28,
          backgroundImage: FileImage(controller.imageFile.value),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: GestureDetector(
            onTap: () {
              controller.chooseProfilePic(context);
            },
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: orangeCustom.withOpacity(0.8),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                Icons.add_a_photo,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget choosePictureIfNull(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.chooseProfilePic(context);
      },
      child: Container(
        height: Get.width / 2.14,
        width: Get.width / 2.14,
        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.3),
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(
          Icons.add_a_photo,
          size: 50,
        ),
      ),
    );
  }

  Widget createTitleAndSubTitle() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: Get.height / 30,
          ),
          Text(
            "Add a profile picture",
            style: Get.textTheme.headlineLarge,
          ),
          SizedBox(
            height: Get.height / 30,
          ),
          Text(
            "Add a beautiful profile picture of you to your account",
            style: Get.textTheme.headlineMedium,
          ),
        ],
      ),
    );
  }

  Widget createSkipButton() {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height / 20,
        left: Get.width / 1.3,
      ),
      child: TextButton(
          onPressed: () {
            controller.changePicture();
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Colors.black,
              decoration: TextDecoration.underline,
            ),
          )),
    );
  }
}
