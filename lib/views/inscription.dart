import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/constants/paints/curve_paint.dart';
import 'package:sportapplication/controller/inscription_screen_controller.dart';

class Inscription extends StatelessWidget {
  Inscription({super.key});
  static const routeName = "/inscription";
  final InscriptionScreenController controller = Get.put(InscriptionScreenController());
  final TextStyle styleLabel = const TextStyle(color: Colors.black);
  final OutlineInputBorder borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.black, width: 1),
  );
  final OutlineInputBorder focusBorderLabel = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(color: Colors.black, width: 2),
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Stack(
          children: [
            CustomPaint(
              painter: CurvePainter(),
              child: Container(height: Get.height / 4),
            ),
            SingleChildScrollView(
              padding: EdgeInsets.only(
                left: Get.width / 20,
                right: Get.width / 20,
                top: Get.height / 8,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Join the Community",
                    style: Get.textTheme.headlineLarge,
                  ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Text(
                    "Unlock Your Athletic Potential",
                    style: Get.textTheme.headlineMedium,
                  ),
                  SizedBox(
                    height: Get.height / 30,
                  ),
                  Obx(
                    () => createForm(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createForm() {
    return Form(
      child: Column(
        children: [
          createGenderRow(),
          createDividerSizedBox(),
          createFullNameField(),
          createDividerSizedBox(),
          createEmailField(),
          createDividerSizedBox(),
          createPhoneNumberField(),
          createDividerSizedBox(),
          createPasswordField(),
          createDividerSizedBox(),
          createConfirmPasswordField(),
          createDividerSizedBox(),
          createWeightRow(),
          createDividerSizedBox(),
          createHeightRow(),
          createDividerSizedBox(),
          createObjectifDropDown(),
          createDividerSizedBox(),
          createAcceptTermsRow(),
          createDividerSizedBox(),
          createRegisterButton(),
          createDividerSizedBox(),
        ],
      ),
    );
  }

  Widget createDividerSizedBox() {
    return SizedBox(
      height: Get.height / 50,
    );
  }

  Widget createRegisterButton() {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width, 50),
        backgroundColor: orangeCustom,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "Register",
        style: TextStyle(color: Colors.white, fontSize: Get.width / 20),
      ),
    );
  }

  Widget createAcceptTermsRow() {
    return Row(
      children: [
        Checkbox(
          value: controller.acceptTerms.value,
          onChanged: (val) => controller.changeAcceptTerms(),
        ),
        SizedBox(
          width: Get.width / 1.5,
          child: RichText(
              text: TextSpan(children: [
            TextSpan(
              text: "I read and accept the ",
              style: Get.textTheme.titleMedium,
            ),
            TextSpan(
              text: "Terms",
              recognizer: TapGestureRecognizer()..onTap = () => {},
              style: Get.textTheme.titleMedium!.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: " and ",
              style: Get.textTheme.titleMedium,
            ),
            TextSpan(
              text: "Conditions",
              recognizer: TapGestureRecognizer()..onTap = () => {},
              style: Get.textTheme.titleMedium!.copyWith(
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.bold,
              ),
            ),
          ])),
        ),
      ],
    );
  }

  Widget createObjectifDropDown() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(vertical: Get.width / 50, horizontal: Get.width / 40),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: DropdownButton(
        isExpanded: true,
        underline: const SizedBox(),
        value: controller.selectedObjectif.value,
        hint: const Text("Select your objective"),
        items: <String>['Loose weight', 'Gain Muscle', 'Maintain your weight'].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
            ),
          );
        }).toList(),
        borderRadius: BorderRadius.circular(10),
        style: Get.textTheme.titleMedium,
        onChanged: (val) => controller.changeSelectedObjectif(val),
      ),
    );
  }

  Widget createHeightRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width / 1.4,
          child: TextField(
            controller: controller.emailController,
            keyboardType: TextInputType.number,
            //text input type for number

            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Your height",
              hintText: "Enter your current height",
              labelStyle: styleLabel,
              border: borderStyle,
              focusedBorder: focusBorderLabel,
            ),
          ),
        ),
        DropdownButton(
          value: controller.selectedHeightValue.value,
          items: <String>['Cm', 'Ft'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          borderRadius: BorderRadius.circular(10),
          style: Get.textTheme.titleMedium,
          onChanged: (val) => controller.changeSelectedHeightValue(val),
        )
      ],
    );
  }

  Widget createWeightRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: Get.width / 1.4,
          child: TextField(
            controller: controller.weightController,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Your weight",
              hintText: "Enter your current weight",
              labelStyle: styleLabel,
              border: borderStyle,
              focusedBorder: focusBorderLabel,
            ),
          ),
        ),
        DropdownButton(
          value: controller.selectedWeightValue.value,
          items: <String>['lbs', 'Kg'].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
              ),
            );
          }).toList(),
          borderRadius: BorderRadius.circular(10),
          style: Get.textTheme.titleMedium,
          onChanged: (val) => controller.changeSelectedWeightValue(val),
        )
      ],
    );
  }

  Widget createConfirmPasswordField() {
    return TextField(
      controller: controller.confirmPasswordController,
      obscureText: !controller.visibleConfirm.value,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Confirm Password",
        hintText: "Enter your password again",
        labelStyle: styleLabel,
        border: borderStyle,
        focusedBorder: focusBorderLabel,
        suffixIcon: controller.visible.value
            ? InkWell(
                onTap: () {
                  controller.showPasswordConfirm();
                },
                child: const Icon(Icons.visibility_off),
              )
            : InkWell(
                onTap: () {
                  controller.showPasswordConfirm();
                },
                child: const Icon(Icons.visibility),
              ),
      ),
    );
  }

  Widget createPasswordField() {
    return TextField(
      controller: controller.passwordController,
      obscureText: !controller.visible.value,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        suffixIcon: controller.visible.value
            ? InkWell(
                onTap: () {
                  controller.showPassword();
                },
                child: const Icon(Icons.visibility_off),
              )
            : InkWell(
                onTap: () {
                  controller.showPassword();
                },
                child: const Icon(Icons.visibility),
              ),
        labelStyle: styleLabel,
        border: borderStyle,
        focusedBorder: focusBorderLabel,
      ),
    );
  }

  TextField createPhoneNumberField() {
    return TextField(
      controller: controller.phoneController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone Number",
        labelStyle: styleLabel,
        border: borderStyle,
        focusedBorder: focusBorderLabel,
      ),
    );
  }

  Widget createEmailField() {
    return TextField(
      controller: controller.emailController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        labelStyle: styleLabel,
        border: borderStyle,
        focusedBorder: focusBorderLabel,
      ),
    );
  }

  Widget createFullNameField() {
    return TextField(
      controller: controller.fullNameController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: "Full Name",
        hintText: "Enter your full name",
        labelStyle: styleLabel,
        border: borderStyle,
        focusedBorder: focusBorderLabel,
      ),
    );
  }

  Widget createGenderRow() {
    return Row(
      children: [
        Text(
          "Gender",
          style: Get.textTheme.titleLarge,
        ),
        SizedBox(
          width: Get.width / 10,
        ),
        RadioMenuButton(
          value: "men",
          groupValue: controller.selectedValue.value,
          onChanged: (value) => controller.changeSelectedValue(value),
          child: Text(
            'Men',
            style: Get.textTheme.titleMedium,
          ),
        ),
        RadioMenuButton(
          value: "women",
          groupValue: controller.selectedValue.value,
          onChanged: (value) => controller.changeSelectedValue(value),
          child: Text(
            'Women',
            style: Get.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
