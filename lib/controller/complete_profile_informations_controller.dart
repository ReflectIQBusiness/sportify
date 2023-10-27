import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sportapplication/models/step_goal.dart';
import 'package:sportapplication/views/set_objectif_screen.dart';

class CompleteProfileinformations extends GetxController {
  var imageFile = File("").obs;
  XFile? pickedFile;
  RxInt currentStep = 1.obs;
  PageController pageController = PageController();
  RxList<StepGoal> steps = [
    StepGoal(
      id: 1,
      title: "Your objectif is",
      description: "This value you already set in the previous step, you can change it if you want",
      choices: [
        Choice(id: 1, title: "Lose weight"),
        Choice(id: 2, title: "Maintain weight"),
        Choice(id: 3, title: "Gain weight"),
      ],
      idChoiceSelected: 1,
    ),
    StepGoal(
      id: 2,
      title: "Identifying the Roadblocks",
      description: " In this step, we'll explore the obstacles and challenges that have prevented you from achieving your goal ",
      choices: [
        Choice(id: 1, title: "I don't have time"),
        Choice(id: 3, title: "I don't have motivation"),
        Choice(id: 4, title: "I don't have support"),
        Choice(id: 5, title: "I don't have knowledge"),
        Choice(id: 8, title: "I don't have confidence"),
        Choice(id: 9, title: "I don't have a plan"),
      ],
      idChoiceSelected: 0,
    ),
    StepGoal(
      id: 3,
      title: "Choosing Your Activity Level",
      description: "This step involves selecting your activity level, which is a key factor in determining your fitness and wellness plan",
      choices: [
        Choice(id: 1, title: "Sedentary"),
        Choice(id: 2, title: "Lightly active"),
        Choice(id: 3, title: "Moderately active"),
        Choice(id: 4, title: "Very active"),
        Choice(id: 5, title: "Extra active"),
      ],
      idChoiceSelected: 0,
    ),
  ].obs;
  chooseProfilePic(context) {
    const textStyle = TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
    Get.bottomSheet(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "Choose Profile Picture",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
          ),
          TextButton(
            child: const Text(" Camera ", style: textStyle),
            onPressed: () {
              Get.back();
              _getFromCamera();
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width / 14.27),
            child: const Divider(),
          ),
          TextButton(
            child: const Text(
              "Gallery",
              style: textStyle,
            ),
            onPressed: () {
              Get.back();
              _getFromGallery();
            },
          )
        ],
      ),
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(60),
          topRight: Radius.circular(60),
        ),
      ),
    );
  }

  _getFromGallery() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 400,
      maxHeight: 400,
    );
    _cropImage(pickedFile!.path);
  }

  /// Crop Image to fit cintainer
  _cropImage(filePath) async {
    CroppedFile? croppedImage = (await ImageCropper().cropImage(
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      sourcePath: filePath,
      maxWidth: 1080,
      maxHeight: 1080,
    ));
    if (croppedImage != null) {
      imageFile.value = File(croppedImage.path);
    }
  }

  _getFromCamera() async {
    pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 400,
      maxHeight: 400,
    );
    _cropImage(pickedFile!.path);
  }

  changePicture() {
    Get.toNamed(SetObjectifScreen.routeName);
  }

  selectChoice(int idStep, int idChoice) {
    steps.value.firstWhere((element) => element.id == idStep).idChoiceSelected = idChoice;
    steps.refresh();
    next(idStep);
  }

  precedent() {
    if (currentStep.value > 1) {
      currentStep.value--;
      pageController.animateToPage(
        currentStep.value - 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      Get.back();
    }
  }

  next(idStep) {
    currentStep.value = idStep + 1;
    pageController.animateToPage(
      currentStep.value - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }
}
