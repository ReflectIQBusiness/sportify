import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/inscription_screen_controller.dart';

class VerifyPin extends StatelessWidget {
  VerifyPin({super.key});
  static const routeName = '/verify-pin';
  final InscriptionScreenController controller =
      Get.isRegistered<InscriptionScreenController>() ? Get.find<InscriptionScreenController>() : Get.put(InscriptionScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify  your phone number ",
                    style: Get.textTheme.headlineLarge,
                  ),
                  createDividerSizedBox(),
                  Text(
                    "A 5-digit code has been sent to your phone number",
                    style: Get.textTheme.titleMedium,
                  ),
                  createDividerSizedBox(),
                  createPinRow(),
                  createDividerSizedBox(),
                  createResendCode(),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Get.height / 20,
              horizontal: Get.width / 20,
            ),
            child: ElevatedButton(
              onPressed: () {
                controller.verifyPin(context);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(Get.width, 50),
                backgroundColor: orangeCustom,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                "Verify",
                style: TextStyle(color: Colors.white, fontSize: Get.width / 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget createDividerSizedBox() {
    return SizedBox(
      height: Get.height / 30,
    );
  }

  Widget createResendCode() {
    return Center(
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "You didn't receive an SMS? ",
              style: Get.textTheme.bodyMedium,
            ),
            TextSpan(
              text: "Resend",
              recognizer: TapGestureRecognizer()..onTap,
              style: Get.textTheme.bodyLarge!.copyWith(
                color: orangeCustom,
                fontWeight: FontWeight.w700,
                decoration: TextDecoration.underline,
                decorationColor: orangeCustom,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget createPinRow() {
    return Center(
      child: SizedBox(
        width: Get.width / 1.4,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            createPinField(
              controller.pin1Controller,
              controller.pin1FocusNode,
              TextInputAction.next,
              nextFocusNode: controller.pin2FocusNode,
            ),
            createPinField(
              controller.pin2Controller,
              controller.pin2FocusNode,
              TextInputAction.next,
              nextFocusNode: controller.pin3FocusNode,
            ),
            createPinField(
              controller.pin3Controller,
              controller.pin3FocusNode,
              TextInputAction.next,
              nextFocusNode: controller.pin4FocusNode,
            ),
            createPinField(
              controller.pin4Controller,
              controller.pin4FocusNode,
              TextInputAction.next,
              nextFocusNode: controller.pin5FocusNode,
            ),
            createPinField(
              controller.pin5Controller,
              controller.pin5FocusNode,
              TextInputAction.done,
              nextFocusNode: null,
            ),
          ],
        ),
      ),
    );
  }

  Widget createPinField(controller, nodeFocus, action, {nextFocusNode}) {
    return SizedBox(
      width: Get.width / 8,
      child: TextField(
        maxLength: 1,
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        textInputAction: action,
        autofocus: true,
        focusNode: nodeFocus,
        style: Get.textTheme.headlineMedium,
        onChanged: (value) {
          if (action == TextInputAction.next) {
            if (controller.text.length == 1) {
              FocusScope.of(Get.context!).requestFocus(nextFocusNode);
            }
          } else {
            if (controller.text.length == 1) {
              FocusScope.of(Get.context!).unfocus();
            }
          }
        },
        decoration: InputDecoration(
          counterText: "",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.black, width: 1),
          ),
        ),
      ),
    );
  }
}
