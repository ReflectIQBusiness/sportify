import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';

class DetailElement extends StatelessWidget {
  static const String routeName = '/detail_element';
  final HomePageController homePageController = Get.find();
  final arg = Get.arguments;
  DetailElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        double protein = homePageController.quantity * arg['protein_g'] / arg['serving_size_g'];
        double fat = homePageController.quantity * arg['fat_total_g'] / arg['serving_size_g'];
        double carbs = homePageController.quantity * arg['carbohydrates_total_g'] / arg['serving_size_g'];
        double total = protein + fat + carbs;
        double calories = homePageController.quantity * arg['calories'] / arg['serving_size_g'];
        return Scaffold(
          appBar: createAppBar(),
          floatingActionButton: createFloatBtn(),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: Get.width / 40,
                horizontal: Get.width / 15,
              ),
              child: Column(
                children: [
                  createIntroImage(),
                  createNameAndQuantityRow(),
                  const SizedBox(height: 5),
                  createNutritionValueRow(calories),
                  SizedBox(height: Get.height / 25),
                  creatFactRow(
                    total: total,
                    path: "assets/protein.svg",
                    title: "Protein",
                    value: protein,
                    color: Colors.green,
                  ),
                  createSpacer(),
                  creatFactRow(
                    total: total,
                    path: "assets/carb.svg",
                    title: "Carbohydrates",
                    value: carbs,
                    color: Colors.blue,
                  ),
                  createSpacer(),
                  creatFactRow(
                    total: total,
                    path: "assets/fat.svg",
                    title: "Fat",
                    value: fat,
                    color: Colors.red,
                  ),
                  SizedBox(height: Get.height / 18),
                  createAdviceContainer(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget createAdviceContainer() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black.withOpacity(0.1),
            Colors.black.withOpacity(0.05),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(Get.width / 30),
            child: SvgPicture.asset(
              "assets/avocado.svg",
              height: Get.height / 20,
              width: Get.height / 20,
            ),
          ),
          SizedBox(width: Get.width / 30),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: Get.height / 50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: Get.width / 1.8,
                  child: Text(
                    "Healthy body comes from healthy food",
                    style: TextStyle(
                      fontSize: Get.width / 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: Get.height / 100),
                Text(
                  "Get good nutrition for your body",
                  style: TextStyle(
                    fontSize: Get.width / 45,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget createNutritionValueRow(double calories) {
    return Row(
      children: [
        Text(
          "Nutrition value",
          style: TextStyle(
            fontSize: Get.width / 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
        const Spacer(),
        Text(
          "${calories.toStringAsFixed(2)} kcal",
          style: TextStyle(
            fontSize: Get.width / 30,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget createNameAndQuantityRow() {
    return Row(
      children: [
        Text(
          arg['name'].toString().toUpperCase(),
          style: TextStyle(
            fontSize: Get.width / 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Spacer(),
        Expanded(
          child: TextField(
            controller: homePageController.quantityController.value,
            keyboardType: TextInputType.number,
            //allowing only double values
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
            ],

            onChanged: (value) {
              homePageController.quantity.value = double.tryParse(value) ?? 1.0;
            },
            decoration: InputDecoration(
                hintText: arg['serving_size_g'].toString(),
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: Get.height / 100,
                  horizontal: Get.width / 30,
                ),
                hintStyle: TextStyle(
                  fontSize: Get.width / 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
                suffix: Text(
                  "g",
                  style: TextStyle(
                    fontSize: Get.width / 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 0.3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: orangeCustom,
                      width: 0.3,
                    ))),
          ),
        ),
      ],
    );
  }

  Container createIntroImage() {
    return Container(
      height: Get.height / 5,
      width: Get.width,
      margin: EdgeInsets.symmetric(
        vertical: Get.height / 50,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: const AssetImage("assets/nutrition.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.6),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          arg['name'].toString().substring(0, 1).toUpperCase(),
          style: TextStyle(
            fontSize: Get.width / 10,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  FloatingActionButton createFloatBtn() {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: orangeCustom,
      child: SvgPicture.asset(
        "assets/eat.svg",
        width: Get.height / 40,
        color: Colors.white,
      ),
    );
  }

  SizedBox createSpacer() => SizedBox(height: Get.height / 50);

  Row creatFactRow({
    required double total,
    required String path,
    required String title,
    required double value,
    required Color color,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: Get.height / 20,
          width: Get.height / 20,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey,
            ),
          ),
          child: Center(
            child: SvgPicture.asset(
              path,
              height: Get.height / 35,
              width: Get.height / 35,
            ),
          ),
        ),
        SizedBox(width: Get.width / 30),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: Get.height / 200,
            ),
            SizedBox(
              width: Get.width / 1.4,
              child: Row(
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: Get.width / 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "${value.toStringAsFixed(2)} g",
                    style: TextStyle(
                      fontSize: Get.width / 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height / 200,
            ),
            SizedBox(
              width: Get.width / 1.4,
              child: LinearProgressIndicator(
                value: value / total,
                backgroundColor: Colors.grey[300],
                valueColor: AlwaysStoppedAnimation<Color>(color),
              ),
            ),
          ],
        )
      ],
    );
  }

  AppBar createAppBar() {
    return AppBar(
      title: Text("Macros",
          style: TextStyle(
            color: Colors.black,
            fontSize: Get.width / 20,
            fontWeight: FontWeight.bold,
          )),
    );
  }
}
// Scaffold(
//           appBar: createAppBar(),
//           floatingActionButton: createFloatBtn(),
//           body: GestureDetector(
//             onTap: () => FocusScope.of(context).unfocus(),
//             child: SingleChildScrollView(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(
//                   vertical: Get.width / 40,
//                   horizontal: Get.width / 15,
//                 ),
//                 child: Column(children: [
//                   createIntroImage(),
//                   createNameAndQuantityRow(),
//                   const SizedBox(height: 5),
//                   createNutritionValueRow(calories),
//                   SizedBox(height: Get.height / 25),
//                   creatFactRow(
//                     total: total,
//                     path: "assets/protein.svg",
//                     title: "Protein",
//                     value: protein,
//                     color: Colors.green,
//                   ),
//                   createSpacer(),
//                   creatFactRow(
//                     total: total,
//                     path: "assets/carb.svg",
//                     title: "Carbohydrates",
//                     value: carbs,
//                     color: Colors.blue,
//                   ),
//                   createSpacer(),
//                   creatFactRow(
//                     total: total,
//                     path: "assets/fat.svg",
//                     title: "Fat",
//                     value: fat,
//                     color: Colors.red,
//                   ),
//                   SizedBox(height: Get.height / 18),
//                   createAdviceContainer(),
//                 ]),
//               ),
//             ),
//           ),
//         );