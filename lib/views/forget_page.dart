import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/forget_password_controller.dart';

class ForgetPage extends StatelessWidget {
  ForgetPage({super.key});
  static const routeName = "/forget";
  final ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createTitle(),
                  createChooseMethodRow(),
                  createDivider(),
                  createSubTitle(),
                  createDivider(),
                  createForm(),
                ],
              ),
            ),
          ),
          createSendButton()
        ],
      ),
    );
  }

  Widget createDivider() {
    return SizedBox(
      height: Get.height / 20,
    );
  }

  Widget createSendButton() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: Get.height / 22),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: Size(Get.width, 50),
          backgroundColor: orangeCustom,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "Send",
          style: TextStyle(color: Colors.white, fontSize: Get.width / 20),
        ),
      ),
    );
  }

  Widget createForm() {
    return Obx(() => Form(
            child: Column(
          children: [
            TextField(
              controller: forgetPasswordController.contactController,
              decoration: InputDecoration(
                hintText: forgetPasswordController.method.value == "email" ? "Email" : "Phone Number",
                hintStyle: Get.textTheme.headlineMedium,
                labelText: forgetPasswordController.method.value == "email" ? "Email" : "Phone Number",
                labelStyle: Get.textTheme.titleMedium,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),
          ],
        )));
  }

  Widget createSubTitle() {
    return Obx(() => forgetPasswordController.method.value == "email"
        ? Text(
            "Enter your email address below to reset your password.",
            style: Get.textTheme.headlineMedium,
          )
        : Text(
            "Enter your phone number below to reset your password.",
            style: Get.textTheme.headlineMedium,
          ));
  }

  Widget createChooseMethodRow() {
    return Obx(() => Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  forgetPasswordController.method.value = "email";
                },
                child: Container(
                  margin: EdgeInsets.only(right: Get.width / 20),
                  padding: EdgeInsets.symmetric(vertical: Get.height / 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: forgetPasswordController.method.value == "email" ? orangeCustom : Colors.white,
                    border: forgetPasswordController.method.value == "email" ? Border.all(color: orangeCustom) : Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.email_outlined,
                      size: Get.width / 15,
                      color: forgetPasswordController.method.value == "email" ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  forgetPasswordController.method.value = "phone";
                },
                child: Container(
                  margin: EdgeInsets.only(right: Get.width / 20),
                  padding: EdgeInsets.symmetric(vertical: Get.height / 50),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: forgetPasswordController.method.value != "email" ? orangeCustom : Colors.white,
                    border: forgetPasswordController.method.value != "email" ? Border.all(color: orangeCustom) : Border.all(color: Colors.grey),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.phone_outlined,
                      size: Get.width / 15,
                      color: forgetPasswordController.method.value != "email" ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Widget createTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: Get.height / 50,
        ),
        Text(
          "Forget Password",
          style: Get.textTheme.headlineLarge,
        ),
        SizedBox(
          height: Get.height / 30,
        ),
      ],
    );
  }
}
