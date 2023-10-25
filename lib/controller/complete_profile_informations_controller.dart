import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class CompleteProfileinformations extends GetxController {
  var imageFile = File("").obs;
  XFile? pickedFile;
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
}
