import 'package:get/get.dart';
import 'package:sportapplication/views/introduction_screen.dart';

class SplashScreenController extends GetxController {
  RxInt scale = 0.obs;
  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 400), () {
      scale.value = 1;
      scale.refresh();
    });
    Future.delayed(Duration(seconds: 2), () {
      Get.offAllNamed(IntroductionScreen.routeName);
    });
  }
}
