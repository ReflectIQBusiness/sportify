import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DetailPrograms extends StatelessWidget {
  DetailPrograms({super.key});
  static const routeName = "/detail-programs";
  final HomePageController homePageController = Get.isRegistered() ? Get.find<HomePageController>() : Get.put(HomePageController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          Get.arguments.name,
          style: Get.textTheme.headlineLarge!.copyWith(color: Colors.white),
        ),
      ),
      body: Stack(
        children: [
          createBackground(),
          Padding(
            padding: EdgeInsets.only(
              top: Get.height / 6,
            ),
            child: createGridView(),
          )
        ],
      ),
    );
  }

  Widget createGridView() {
    return GridView(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.6,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: [
        ...homePageController.detailsProgram.map(
          (element) {
            return createProgramContainer(element);
          },
        )
      ],
    );
  }

  Container createProgramContainer(VideoPlayerController element) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: NetworkImage(YoutubePlayer.getThumbnail(
              videoId: YoutubePlayer.convertUrlToId(element.dataSource)!,
            )),
          )),
      child: Container(
        height: Get.height / 8,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.2),
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
        child: createColumnDurationAndLevel(element),
      ),
    );
  }

  Widget createColumnDurationAndLevel(VideoPlayerController element) {
    return Align(
      alignment: const Alignment(0, 0.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: createRowDuration(element),
          ),
          const SizedBox(
            height: 10,
          ),
          createRowLevel(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget createRowLevel() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Icon(
            CupertinoIcons.layers_alt_fill,
            color: orangeCustom,
            size: 15,
          ),
          const SizedBox(
            width: 10,
          ),
          const Text(
            "Professional",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget createRowDuration(VideoPlayerController element) {
    return Row(
      children: [
        Icon(
          Icons.timer,
          color: orangeCustom,
          size: 15,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          "${20 + homePageController.detailsProgram.indexOf(element)} Minutes",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget createBackground() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(Get.arguments.image),
          fit: BoxFit.cover,
          opacity: 0.2,
          colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.hue),
        ),
      ),
    );
  }
}
