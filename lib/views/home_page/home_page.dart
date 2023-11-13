import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:sportapplication/views/home_page/daily_nutritions.dart';
import 'package:sportapplication/views/home_page/dashboard.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  static const routeName = "/home-page";
  final HomePageController homePageController =
      Get.isRegistered<HomePageController>() ? Get.find<HomePageController>() : Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          return IndexedStack(
            index: homePageController.currentIndex.value,
            children: [
              Dashboard(
                homePageController: homePageController,
              ),
              DailyNutritions(
                homePageController: homePageController,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: createBottomNavigationBar(),
    );
  }

  Widget createBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        iconSize: Get.width / 16,
        onTap: (index) {
          homePageController.changeIndex(index);
        },
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        type: BottomNavigationBarType.shifting,
        currentIndex: homePageController.currentIndex.value,
        fixedColor: orangeCustom,
        selectedFontSize: Get.width / 30,
        landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.doc_plaintext),
            label: 'Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'More',
          ),
        ],
      ),
    );
  }
}
