import 'package:get/route_manager.dart';
import 'package:sportapplication/views/choose_profile_pic.dart';
import 'package:sportapplication/views/detail_programs.dart';
import 'package:sportapplication/views/forget_page.dart';
import 'package:sportapplication/views/home_page/add_element.dart';
import 'package:sportapplication/views/home_page/detail_element.dart';
import 'package:sportapplication/views/home_page/home_page.dart';
import 'package:sportapplication/views/inscription.dart';
import 'package:sportapplication/views/introduction_screen.dart';
import 'package:sportapplication/views/login.dart';
import 'package:sportapplication/views/more_page/achievements.dart';
import 'package:sportapplication/views/more_page/activity_history.dart';
import 'package:sportapplication/views/more_page/contact_us.dart';
import 'package:sportapplication/views/more_page/personal_information.dart';
import 'package:sportapplication/views/more_page/privacy_policy.dart';
import 'package:sportapplication/views/set_objectif_screen.dart';
import 'package:sportapplication/views/splash_screen.dart';
import 'package:sportapplication/views/verify_phone.dart';
import 'package:sportapplication/views/video_screen.dart';

var routes = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: IntroductionScreen.routeName,
    page: () => IntroductionScreen(),
    transition: Transition.leftToRight,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Login.routeName,
    page: () => Login(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: Inscription.routeName,
    page: () => Inscription(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: VerifyPin.routeName,
    page: () => VerifyPin(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: ChooseProfilePic.routeName,
    page: () => ChooseProfilePic(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: SetObjectifScreen.routeName,
    page: () => SetObjectifScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: ForgetPage.routeName,
    page: () => ForgetPage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: HomePage.routeName,
    page: () => HomePage(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: DetailPrograms.routeName,
    page: () => DetailPrograms(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: VideoScreen.routeName,
    page: () => VideoScreen(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
  GetPage(
    name: AddElement.routeName,
    page: () => AddElement(),
    transition: Transition.rightToLeft,
  ),
  GetPage(
    name: DetailElement.routeName,
    page: () => DetailElement(),
    transition: Transition.topLevel,
  ),
  GetPage(
    name: PersonalInformation.routeName,
    page: () => PersonalInformation(),
    transition: Transition.topLevel,
  ),
  GetPage(
    name: Achievements.routeName,
    page: () => Achievements(),
  ),
  GetPage(
    name: ActivityHistory.routeName,
    page: () => const ActivityHistory(),
  ),
  GetPage(
    name: PrivacyPolicy.routeName,
    page: () => PrivacyPolicy(),
  ),
  GetPage(
    name: ContactUS.routeName,
    page: () => ContactUS(),
    transition: Transition.rightToLeft,
    transitionDuration: const Duration(milliseconds: 400),
  ),
];
