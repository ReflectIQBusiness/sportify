import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});
  static const routeName = "/settings";
  final HomePageController homePageController = Get.isRegistered<HomePageController>() ? Get.find() : Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createSpacer(),
              createUnitSettingTitle(),
              createSpacer(),
              createUnitSettingCard(),
              createSpacer(),
              createAppSettingTitle(),
              createSpacer(),
              createAppSettingCard(),
              createSpacer(),
              createLogo()
            ],
          ),
        ),
      ),
    );
  }

  SizedBox createSpacer() {
    return SizedBox(
      height: Get.width / 21.4,
    );
  }

  Widget createLogo() {
    return Center(
      child: Image.asset(
        "assets/logo.png",
        width: Get.width / 2,
      ),
    );
  }

  Text createAppSettingTitle() {
    return Text(
      "App Setting",
      style: TextStyle(
        fontSize: Get.width / 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text createUnitSettingTitle() {
    return Text(
      "Unit Setting",
      style: TextStyle(
        fontSize: Get.width / 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Card createAppSettingCard() {
    return Card(
      elevation: 10,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Column(
        children: [
          createWorkoutNotification(homePageController: homePageController),
          createFoodNotification(),
          createNewsNotification(),
        ],
      ),
    );
  }

  ListTile createNewsNotification() {
    return ListTile(
      leading: Icon(
        CupertinoIcons.news,
        color: orangeCustom,
      ),
      title: const Text("News Notification"),
      trailing: Obx(
        () => Switch(
          value: homePageController.news.value,
          onChanged: (value) {
            homePageController.changeNews();
          },
          activeColor: orangeCustom,
        ),
      ),
    );
  }

  ListTile createFoodNotification() {
    return ListTile(
      leading: SvgPicture.asset(
        "assets/food.svg",
        color: orangeCustom,
        width: 22,
      ),
      title: const Text("Nutrition Notification"),
      trailing: Obx(
        () => Switch(
          value: homePageController.nutrition.value,
          onChanged: (value) {
            homePageController.changeNutrition();
          },
          activeColor: orangeCustom,
        ),
      ),
    );
  }

  Card createUnitSettingCard() {
    return Card(
      elevation: 10,
      surfaceTintColor: Colors.white,
      color: Colors.white,
      child: Column(
        children: [
          createWeightSettingRow(),
          createHeightSettingRow(),
        ],
      ),
    );
  }

  ListTile createHeightSettingRow() {
    return ListTile(
      leading: Icon(
        Icons.height_outlined,
        color: orangeCustom,
      ),
      title: const Text("Height Unit"),
      trailing: Obx(
        () => SizedBox(
          width: Get.width / 3,
          child: Row(
            children: [
              Text(
                "Cm",
                style: Get.textTheme.labelSmall,
              ),
              SizedBox(
                width: Get.width / 4,
                child: Switch(
                  value: homePageController.height.value,
                  onChanged: (value) {
                    homePageController.changeHeight();
                  },
                  activeColor: orangeCustom,
                ),
              ),
              Text(
                "ft",
                style: Get.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile createWeightSettingRow() {
    return ListTile(
      leading: Icon(
        Icons.monitor_weight_outlined,
        color: orangeCustom,
      ),
      title: const Text("Weight Unit"),
      trailing: Obx(
        () => SizedBox(
          width: Get.width / 3,
          child: Row(
            children: [
              Text(
                "Kg",
                style: Get.textTheme.labelSmall,
              ),
              SizedBox(
                width: Get.width / 4,
                child: Switch(
                  value: homePageController.kg.value,
                  onChanged: (value) {
                    homePageController.changeKg();
                  },
                  activeColor: orangeCustom,
                ),
              ),
              Text(
                "Lbs",
                style: Get.textTheme.labelSmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class createWorkoutNotification extends StatelessWidget {
  const createWorkoutNotification({
    super.key,
    required this.homePageController,
  });

  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.sports_martial_arts_sharp,
        color: orangeCustom,
      ),
      title: const Text("Workout Notification"),
      trailing: Obx(
        () => Switch(
          value: homePageController.workout.value,
          onChanged: (value) {
            homePageController.changeWorkout();
          },
          activeColor: orangeCustom,
        ),
      ),
    );
  }
}

AppBar createAppBar() {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text("Settings",
        style: TextStyle(
          fontSize: Get.width / 20,
          fontWeight: FontWeight.w600,
        )),
  );
}
