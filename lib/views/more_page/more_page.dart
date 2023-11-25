import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:sportapplication/views/more_page/achievements.dart';
import 'package:sportapplication/views/more_page/activity_history.dart';
import 'package:sportapplication/views/more_page/personal_information.dart';

class MorePage extends StatelessWidget {
  final HomePageController homePageController;
  const MorePage({
    required this.homePageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: Get.width / 25, color: orangeCustom, fontWeight: FontWeight.bold);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          top: Get.height / 20,
          left: Get.width / 20,
          right: Get.width / 20,
        ),
        child: Column(
          children: [
            createInformationsRow(),
            spacerVerticalSizedBox(),
            createValuesRow(textStyle),
            spacerVerticalSizedBox(),
            createAccountCard(),
            spacerVerticalSizedBox(),
            createNotificationCard(),
            spacerVerticalSizedBox(),
            createOtherCard()
          ],
        ),
      ),
    );
  }

  Widget createValuesRow(TextStyle textStyle) {
    return Row(
      children: [
        createValueCard(textStyle, "164 cm", "Height"),
        spacerHorizontalSizedBox(),
        createValueCard(textStyle, "65 kg", "Weight"),
        spacerHorizontalSizedBox(),
        createValueCard(textStyle, "25 yo", "Age"),
      ],
    );
  }

  Widget createOtherCard() {
    return Card(
      elevation: 4,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height / 50, horizontal: Get.width / 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Other", style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: orangeCustom,
            ),
            title: const Text("Contact us"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.security, color: orangeCustom),
            title: const Text("Privacy policy"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: orangeCustom),
            title: const Text("Settings"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ]),
      ),
    );
  }

  Widget createNotificationCard() {
    return Card(
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height / 50, horizontal: Get.width / 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Notification", style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
              ListTile(
                leading: Icon(
                  CupertinoIcons.bell,
                  color: orangeCustom,
                ),
                title: const Text("Notification settings"),
                trailing: Obx(
                  () => Switch(
                    value: homePageController.notification.value,
                    onChanged: (value) {
                      homePageController.changeNotification();
                    },
                    activeColor: orangeCustom,
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget createAccountCard() {
    return Card(
      elevation: 4,
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: Get.height / 50, horizontal: Get.width / 30),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Account", style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold)),
          ListTile(
            onTap: () => Get.toNamed(
              PersonalInformation.routeName,
            ),
            leading: Icon(
              CupertinoIcons.person,
              color: orangeCustom,
            ),
            title: const Text("Personal informations"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () => Get.toNamed(
              Achievements.routeName,
            ),
            leading: Icon(CupertinoIcons.doc_chart, color: orangeCustom),
            title: const Text("Achievements"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            onTap: () => Get.toNamed(
              ActivityHistory.routeName,
            ),
            leading: Icon(CupertinoIcons.graph_circle, color: orangeCustom),
            title: const Text("Activity history"),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ]),
      ),
    );
  }

  Widget spacerVerticalSizedBox() {
    return SizedBox(
      height: Get.height / 30,
    );
  }

  Widget spacerHorizontalSizedBox() {
    return SizedBox(
      width: Get.width / 40,
    );
  }

  Widget createValueCard(TextStyle textStyle, value, text) {
    return Expanded(
      child: Card(
        elevation: 4,
        color: Colors.white,
        surfaceTintColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Text(value, style: textStyle),
              SizedBox(
                height: Get.height / 100,
              ),
              Text(text),
            ],
          ),
        ),
      ),
    );
  }

  Widget createInformationsRow() {
    return const Row(
      children: [
        Center(
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(
              "assets/cat.jpeg",
            ),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "John Doe",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Lose weight program",
            ),
          ],
        ),
      ],
    );
  }
}
