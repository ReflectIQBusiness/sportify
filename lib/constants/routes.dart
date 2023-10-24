import 'package:get/route_manager.dart';
import 'package:sportapplication/views/inscription.dart';
import 'package:sportapplication/views/introduction_screen.dart';
import 'package:sportapplication/views/login.dart';
import 'package:sportapplication/views/splash_screen.dart';
import 'package:sportapplication/views/verify_phone.dart';

var routes = [
  GetPage(
    name: SplashScreen.routeName,
    page: () => SplashScreen(),
  ),
  GetPage(
    name: IntroductionScreen.routeName,
    page: () => IntroductionScreen(),
    transition: Transition.leftToRight,
    transitionDuration: Duration(milliseconds: 400),
  ),
  GetPage(
    name: Login.routeName,
    page: () => Login(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 400),
  ),
  GetPage(
    name: Inscription.routeName,
    page: () => Inscription(),
    transition: Transition.leftToRightWithFade,
    transitionDuration: Duration(milliseconds: 400),
  ),
  GetPage(
    name: VerifyPin.routeName,
    page: () => VerifyPin(),
    transition: Transition.rightToLeft,
    transitionDuration: Duration(milliseconds: 400),
  ),
];
