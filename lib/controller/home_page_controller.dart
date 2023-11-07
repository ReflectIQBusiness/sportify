import 'package:get/get.dart';
import 'package:sportapplication/models/calorie.dart';
import 'package:sportapplication/models/program.dart';
import 'package:sportapplication/views/detail_programs.dart';
import 'package:sportapplication/views/video_screen.dart';
import 'package:video_player/video_player.dart';

class HomePageController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxList<Calorie> dataCalories = [
    Calorie(calorie: 2000, date: DateTime.now().subtract(Duration(days: 6)).toString()),
    Calorie(calorie: 2500, date: DateTime.now().subtract(Duration(days: 5)).toString()),
    Calorie(calorie: 1000, date: DateTime.now().subtract(Duration(days: 4)).toString()),
    Calorie(calorie: 1500, date: DateTime.now().subtract(Duration(days: 3)).toString()),
    Calorie(calorie: 1000, date: DateTime.now().subtract(Duration(days: 2)).toString()),
    Calorie(calorie: 2000, date: DateTime.now().subtract(Duration(days: 1)).toString()),
    Calorie(calorie: 3000, date: DateTime.now().toString()),
  ].obs;

  RxList<Program> program = [
    Program(
      id: 1,
      name: "Chest Workouts",
      image: "https://www.workouthealthy.com/cdn-cgi/image/quality%3D85/assets/images/Blog/best-chest-workouts-for-definition.png",
    ),
    Program(
      id: 2,
      name: "Abs Workouts",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFoeBRdfkTwKx3mWWj-8YVMB7qVI_LKSGaunYkd78MrvpkisSBKXrbpF_LbG-PAAPmlFQ&usqp=CAU",
    ),
    Program(
      id: 3,
      name: "Legs Workouts",
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDQ7zl-9saJcmY-J2V_14ZigWdKUT--CWnhllXywJlGvMAqeYBT1FGlQ5RXoYnFKABkxs&usqp=CAU",
    ),
    Program(
      id: 4,
      name: "Shoulder Workouts",
      image: "https://hugesupplements.com/cdn/shop/articles/Best-shoulder-workout-for-muscle-mass.jpg?v=1614950209",
    ),
  ].obs;
  final List<String> absWorkoutInstructions = [
    "Warm up for 5 minutes with light cardio.",
    "Do 3 sets of 15 push-ups.",
    "Perform 3 sets of 12 squats.",
    "Rest for 2 minutes between sets.",
    "Finish with a 10-minute cool-down and stretching.",
  ];
  RxList<VideoPlayerController> detailsProgram = <VideoPlayerController>[].obs;
  changeIndex(int index) {
    currentIndex.value = index;
    currentIndex.refresh();
  }

  goToDetail(int index) {
    detailsProgram.value = [];
    detailsProgram.refresh();
    if (index == 1) {
      detailsProgram.value = [
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/dPb9JxFMuuE?si=W1sdQEQ2Z0aziI_w"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/oo0bZ6Vrepg?si=i7ndLPbzJmhcqtmO"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/qwx1VV9vV1A?si=kBPDM8pdVmSF8WKR"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/D11VtOOniWA?si=RTBPPIIaZKQxL_hN"))..initialize()
      ];
    } else if (index == 2) {
      detailsProgram.value = [
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/qfWx1EPdhwE?si=Rkee7Fu6v5MU-Nub"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/h4N_fKnAWL8?si=V89KEMUcnoe2oi-f"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/2pLT-olgUJs?si=YruydBKPP4V2KhnV"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/vkKCVCZe474?si=zSaxvzJUVuZfO3UQ"))..initialize(),
      ];
    } else if (index == 3) {
      detailsProgram.value = [
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/H6mRkx1x77k?si=ILlMzYkPRo-18wQN"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/2-TOX8RFhr8?si=Oyb-fBcpvzxABvm_"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/j1FTQvVDZEI?si=R7ZAP51AXJd1qm8-"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/DpIeBMgh2OA?si=0Zlaa9Bb0HV3l1R2"))..initialize(),
      ];
    } else {
      detailsProgram.value = [
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/VpdweBmj3Yk?si=3Z2gspKNix-qx5AI"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/sUNv3uHAP6I?si=nFL46BD6AzHvPJ9K"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/2MJ6jVlDMvY?si=rDQZeuQaQf7xHqo3"))..initialize(),
        VideoPlayerController.networkUrl(Uri.parse("https://youtu.be/HGfQgeMPWTs?si=GCcMHul9Y5T2NQa1"))..initialize(),
      ];
    }
    Get.toNamed(DetailPrograms.routeName, arguments: program.firstWhere((element) => element.id == index));
  }

  goToVideoPage(element) {
    Get.toNamed(VideoScreen.routeName, arguments: element);
  }
}