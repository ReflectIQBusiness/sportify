import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';

class PersonalInformation extends StatelessWidget {
  static const routeName = "/personal-information";
  final HomePageController homePageController =
      Get.isRegistered<HomePageController>() ? Get.find<HomePageController>() : Get.put(HomePageController());
  PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      backgroundColor: Colors.white,
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                top: Get.height / 30,
                left: Get.width / 20,
                right: Get.width / 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  createImageIntro(),
                  createTitle("General information"),
                  createVerticalTitleSpacer(),
                  createRowLastAndFirstName(),
                  spacerVerticalSizedBox(),
                  createEmail(),
                  spacerVerticalSizedBox(),
                  createPhoneNumber(),
                  spacerVerticalSizedBox(),
                  createRowWeightAndHeight(),
                  spacerVerticalSizedBox(),
                  createTextFieldAge(context),
                  createDivider(),
                  createTitle("Security"),
                  createVerticalTitleSpacer(),
                  createChangePassword(),
                  spacerVerticalSizedBox(),
                  createDeleteAccount(),
                  spacerVerticalSizedBox(),
                  createSaveBtn(),
                  createVerticalTitleSpacer()
                ],
              ),
            ),
          )),
    );
  }

  ElevatedButton createSaveBtn() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: orangeCustom,
        maximumSize: Size(Get.width, Get.height / 15),
        minimumSize: Size(Get.width, Get.height / 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          vertical: Get.height / 50,
        ),
      ),
      onPressed: () {},
      child: Text("Save",
          style: TextStyle(
            color: Colors.white,
            fontSize: Get.width / 20,
            fontWeight: FontWeight.bold,
          )),
    );
  }

  SizedBox createDivider() {
    return SizedBox(
      height: Get.height / 30,
    );
  }

  TextField createTextFieldAge(BuildContext context) {
    return TextField(
      controller: TextEditingController(text: "25 yo"),
      decoration: getDecoration("Age"),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime(1998),
          firstDate: DateTime(1900),
          lastDate: DateTime.now().subtract(const Duration(
            days: 365 * 17,
          )),
        );
      },
      cursorHeight: Get.width / 40,
      cursorColor: Colors.black,
      keyboardType: TextInputType.number,
    );
  }

  Center createImageIntro() {
    return Center(
      child: Container(
        height: Get.height / 8,
        margin: EdgeInsets.only(bottom: Get.height / 40),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: const AssetImage("assets/fitness.jpg"),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.6),
              BlendMode.darken,
            ),
          ),
        ),
        child: Center(
            child: Text("Your Account",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: Get.width / 15,
                  fontWeight: FontWeight.bold,
                ))),
      ),
    );
  }

  SizedBox createVerticalTitleSpacer() {
    return SizedBox(
      height: Get.height / 50,
    );
  }

  Text createTitle(label) {
    return Text(label,
        style: TextStyle(
          fontSize: Get.width / 20,
          fontWeight: FontWeight.bold,
        ));
  }

  Row createRowWeightAndHeight() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: getDecoration('Weight', suffix: 'Kg'),
            controller: TextEditingController(text: "65"),
            cursorHeight: Get.width / 40,
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
          ),
        ),
        SizedBox(
          width: Get.width / 20,
        ),
        Expanded(
          child: TextField(
            decoration: getDecoration('Height', suffix: 'cm'),
            controller: TextEditingController(text: "164"),
            cursorHeight: Get.width / 40,
            cursorColor: Colors.black,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Widget createChangePassword() {
    return Container(
      width: Get.width,
      padding: EdgeInsets.symmetric(
        horizontal: Get.width / 50,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.16),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          'Change Password',
          style: TextStyle(
            fontSize: Get.width / 26,
            color: Colors.black,
          ),
        ),
        trailing: Icon(
          CupertinoIcons.arrow_down_right_circle,
          color: orangeCustom,
        ),
      ),
    );
  }

  TextField createEmail() {
    return TextField(
      controller: TextEditingController(text: "john.doe@gmail.com"),
      decoration: getDecoration("Email"),
      cursorHeight: Get.width / 40,
      cursorColor: Colors.black,
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget createRowLastAndFirstName() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: TextEditingController(text: "John"),
            decoration: getDecoration("First Name"),
            cursorHeight: Get.width / 40,
            cursorColor: Colors.black,
          ),
        ),
        SizedBox(
          width: Get.width / 20,
        ),
        Expanded(
          child: TextField(
            controller: TextEditingController(text: "Doe"),
            decoration: getDecoration("Last Name"),
            cursorHeight: Get.width / 40,
            cursorColor: Colors.black,
          ),
        ),
      ],
    );
  }

  InputDecoration getDecoration(label, {suffix}) {
    return InputDecoration(
      labelText: label,
      isDense: true,
      labelStyle: TextStyle(
        fontSize: Get.width / 35,
      ),
      focusColor: orangeCustom,
      suffix: suffix != null
          ? Text(
              suffix,
              style: TextStyle(
                color: Colors.black,
                fontSize: Get.width / 30,
              ),
            )
          : null,
      floatingLabelStyle: TextStyle(
        color: orangeCustom,
        fontWeight: FontWeight.w600,
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: orangeCustom),
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      centerTitle: true,
      leading: leadingBtn(),
      title: Text(
        "Personal Information",
        style: TextStyle(
          color: Colors.black,
          fontSize: Get.width / 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget leadingBtn() {
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: const Icon(
        CupertinoIcons.back,
        color: Colors.black,
      ),
    );
  }

  Widget spacerVerticalSizedBox() {
    return SizedBox(
      height: Get.height / 100,
    );
  }

  Widget createPhoneNumber() {
    return TextField(
      controller: TextEditingController(text: "+1 234 567 89"),
      decoration: getDecoration("Phone Number"),
      cursorHeight: Get.width / 40,
      cursorColor: Colors.black,
      keyboardType: TextInputType.phone,
    );
  }

  createDeleteAccount() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          width: Get.width / 3,
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            horizontalTitleGap: 0,
            onTap: () {
              homePageController.deleteAccount();
            },
            leading: const Icon(
              Icons.delete_forever,
              size: 22,
            ),
            title: Text(
              'Delete Account',
              style: TextStyle(
                fontSize: Get.width / 30,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
