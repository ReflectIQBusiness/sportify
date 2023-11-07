import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({super.key});
  static const routeName = "/video-screen";
  final HomePageController homePageController = Get.isRegistered() ? Get.find() : Get.put(HomePageController());
  VideoPlayerController videoPlayerController = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 2,
              child: Expanded(
                child: YoutubePlayer(
                  controller: YoutubePlayerController(
                    initialVideoId: YoutubePlayer.convertUrlToId(
                      videoPlayerController.dataSource,
                    )!,
                  ),
                ),
              ),
            ),
            SizedBox(height: Get.height / 35),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
              child: Text(
                "Instructions:",
                style: TextStyle(
                  fontSize: Get.width / 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
              child: Text(
                "Here are some intructions to help you get your workout done as a champion 🏆",
                style: TextStyle(
                  fontSize: Get.width / 28,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(255, 135, 128, 128),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ...homePageController.absWorkoutInstructions.map((e) {
              return InstructionCard(instruction: e, step: homePageController.absWorkoutInstructions.indexOf(e) + 1);
            }),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class InstructionCard extends StatelessWidget {
  final String instruction;
  final int step;

  const InstructionCard({super.key, required this.instruction, required this.step});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: Card(
        surfaceTintColor: Colors.white,
        margin: EdgeInsets.symmetric(horizontal: Get.width / 15, vertical: Get.height / 70),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Number $step",
                style: TextStyle(
                  fontSize: Get.width / 24,
                  fontWeight: FontWeight.bold,
                  color: orangeCustom,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                instruction,
                style: TextStyle(
                  fontSize: Get.width / 25,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
