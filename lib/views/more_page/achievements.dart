import 'package:flutter/material.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:get/get.dart';

class Achievements extends StatelessWidget {
  static const routeName = "/achievements";
  final HomePageController homePageController = HomePageController();
  Achievements({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: Padding(
        padding: returnGeneralPadding(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            championText(),
            spacer(),
            textYourAchievements(),
            GridView(
              gridDelegate: returnSliverDelegate(),
              shrinkWrap: true,
              padding: paddingGrid(),
              children: [
                createAchievementCard("assets/health-app.png", "Join us", true),
                createAchievementCard("assets/man.png", "Walk 5000 steps", true),
                createAchievementCard("assets/trophy_winner_prize_achievement_champion_icon.png", "Add first program", true),
                createAchievementCard("assets/weighing-scale.png", "Lose weight", true),
                createAchievementCard("assets/running-man.png", "Walk 20000 steps", false, value: 0.7),
                createAchievementCard("assets/wearing-fitness-watch.png", "Keep 7 days track", false, value: 0.5),
                createAchievementCard("assets/trophy.png", "Losing 7 kgs", false, value: 0.3),
              ],
            )
          ],
        ),
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
        title: Text("Achievements",
            style: TextStyle(
              color: Colors.black,
              fontSize: Get.width / 15,
            )));
  }

  EdgeInsets returnGeneralPadding() {
    return EdgeInsets.only(
      top: Get.height / 20,
      left: Get.width / 20,
      right: Get.width / 20,
    );
  }

  EdgeInsets paddingGrid() {
    return EdgeInsets.only(
      top: Get.height / 15,
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount returnSliverDelegate() {
    return const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 3,
      crossAxisSpacing: 0,
      mainAxisSpacing: 10,
      mainAxisExtent: 130,
    );
  }

  Text textYourAchievements() {
    return Text(
      "Your achievements",
      style: TextStyle(
        fontSize: Get.width / 20,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  SizedBox spacer() {
    return const SizedBox(
      height: 5,
    );
  }

  Text championText() {
    return Text(
      "Dear champion! Joe ✨",
      style: TextStyle(
        fontSize: Get.width / 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  createAchievementCard(String s, String t, bool bool, {double? value}) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: Get.width / 5,
              height: Get.width / 5,
              child: CircularProgressIndicator(
                value: bool ? 1 : value,
                color: bool ? orangeCustom : Colors.orange.withOpacity(0.3),
              ),
            ),
            Container(
              width: Get.width / 5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: bool ? orangeCustom.withOpacity(0.3) : Colors.orange.withOpacity(0.1),
              ),
              child: Center(
                child: Image.asset(
                  s,
                  fit: BoxFit.cover,
                  width: Get.width / 6,
                  opacity: AlwaysStoppedAnimation(bool ? 1 : 0.5),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: Get.height / 100,
        ),
        Text(
          t,
          style: TextStyle(
            fontSize: Get.width / 30,
            fontWeight: FontWeight.bold,
            color: bool ? Colors.black : Colors.grey.withOpacity(0.5),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
  // Scaffold(
//         appBar: createAppBar(),
//         body: Padding(
//           padding: returnGeneralPadding(),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               championText(),
//               spacer(),
//               textYourAchievements(),
//               Expanded(
//                   child: GridView(
//                 shrinkWrap: true,
//                 padding: paddingGrid(),
//                 gridDelegate: returnSliverDelegate(),
//                 children: [
//                   createAchievementCard("assets/health-app.png", "Join us", true),
//                   createAchievementCard("assets/man.png", "Walk 5000 steps", true),
//                   createAchievementCard("assets/trophy_winner_prize_achievement_champion_icon.png", "Add first program", true),
//                   createAchievementCard("assets/weighing-scale.png", "Lose weight", true),
//                   createAchievementCard("assets/running-man.png", "Walk 20000 steps", false, value: 0.7),
//                   createAchievementCard("assets/wearing-fitness-watch.png", "Keep 7 days track", false, value: 0.5),
//                   createAchievementCard("assets/trophy.png", "Losing 7 kgs", false, value: 0.3),
//                 ],
//               ))
//             ],
//           ),
//         ));
}
