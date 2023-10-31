import 'package:get/get.dart';
import 'package:sportapplication/models/calorie.dart';
import 'package:sportapplication/models/program.dart';

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

  changeIndex(int index) {
    currentIndex.value = index;
    currentIndex.refresh();
  }
}
