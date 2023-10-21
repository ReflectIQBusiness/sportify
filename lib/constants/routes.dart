import 'package:get/route_manager.dart';
import 'package:sportapplication/views/introduction_screen.dart';
import 'package:sportapplication/views/splash_screen.dart';

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
  )
];
