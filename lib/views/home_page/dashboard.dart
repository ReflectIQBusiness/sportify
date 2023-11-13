import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:sportapplication/models/calorie.dart';
import 'package:sportapplication/models/program.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatelessWidget {
  final HomePageController homePageController;
  const Dashboard({super.key, required this.homePageController});

  @override
  Widget build(BuildContext context) {
    var valuesStyle = TextStyle(
      color: Colors.white,
      fontSize: Get.width / 25,
      fontWeight: FontWeight.bold,
    );
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: Get.width / 20,
        right: Get.width / 20,
        top: Get.height / 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          createAppBar(),
          createDivider(),
          createTodayRowData(valuesStyle),
          createDivider(),
          createChartWidget(),
          createDivider(),
          createDivider(),
          createTitleWorkout(),
          createDivider(),
          createWorkouts()
        ],
      ),
    );
  }

  Widget createTitleWorkout() => Text("Workouts", style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600));

  Widget createWorkouts() {
    return Column(
      children: [
        ...homePageController.program.map((element) => createProgramWidget(element)),
      ],
    );
  }

  Widget createProgramWidget(Program element) {
    return InkWell(
      onTap: () {
        homePageController.goToDetail(element.id);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: Get.height / 5,
          width: Get.width,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.16), blurRadius: 5, spreadRadius: 2),
            ],
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                element.image,
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.darken),
            ),
          ),
          child: Center(
            child: Text(
              element.name,
              style: Get.textTheme.headlineLarge!.copyWith(color: orangeCustom),
            ),
          ),
        ),
      ),
    );
  }

  Widget createTodayRowData(TextStyle valuesStyle) {
    return Wrap(
      spacing: 5,
      children: [
        createStepGlass(valuesStyle),
        createCaloriesGlass(valuesStyle),
        createDistanceGlass(valuesStyle),
      ],
    );
  }

  Widget createDivider() {
    return SizedBox(
      height: Get.height / 20,
    );
  }

  Widget createChartWidget() {
    return Column(
      children: [
        Row(
          children: [
            Text("Calories burned", style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600)),
            const Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Weekly Average", style: Get.textTheme.bodyMedium),
                Text("1250 kcal", style: Get.textTheme.bodyMedium),
              ],
            ),
          ],
        ),
        SizedBox(
          height: Get.height / 40,
        ),
        Transform.rotate(
          angle: -3.14 / 2,
          child: SfCartesianChart(
            plotAreaBorderColor: Colors.transparent,
            primaryXAxis: CategoryAxis(isVisible: false),
            plotAreaBorderWidth: 0,
            margin: EdgeInsets.zero,
            primaryYAxis: NumericAxis(
              isVisible: false, // Hide Y-axis labels and ticks
            ),
            // Enable legend
            legend: Legend(isVisible: false),
            // Enable tooltip
            tooltipBehavior: TooltipBehavior(enable: true),
            series: <ChartSeries>[
              BarSeries<Calorie, String>(
                dataSource: homePageController.dataCalories.reversed.toList(),
                xValueMapper: (data, _) => data.date,
                yValueMapper: (data, _) => data.calorie,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                borderRadius: BorderRadius.circular(10),
                width: 0.9,
                pointColorMapper: (data, _) {
                  // Change the color of the bar when the date matches today's date.
                  //format: yyyy-MM-dd
                  if (data.date.substring(0, 10) == DateTime.now().toString().substring(0, 10)) {
                    return orangeCustom; // Change the color to green for today's bar
                  }
                  return Colors.black.withOpacity(0.3); // Default color for other bars
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget createDistanceGlass(TextStyle valuesStyle) {
    return GlassmorphicContainer(
      width: Get.width / 3.5, // Width of the container
      height: Get.height / 6, // Height of the container
      borderRadius: 20, // Border radius of the container
      linearGradient: const LinearGradient(
        // Background gradient
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 255, 0, 0),
          Color.fromARGB(255, 255, 115, 0),
        ],
      ),
      border: 2, // Border width
      blur: 10, // Gaussian blur
      borderGradient: const LinearGradient(
        // Border gradient
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0x99ffffff),
          Color(0x33ffffff),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.blur_linear,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Distances",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "0 km",
              style: valuesStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget createCaloriesGlass(TextStyle valuesStyle) {
    return GlassmorphicContainer(
      width: Get.width / 3.5, // Width of the container
      height: Get.height / 6, // Height of the container
      borderRadius: 20, // Border radius of the container
      linearGradient: const LinearGradient(
        // Background gradient
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 255, 0, 0),
          Color.fromARGB(255, 255, 115, 0),
        ],
      ),
      border: 2, // Border width
      blur: 10, // Gaussian blur
      borderGradient: const LinearGradient(
        // Border gradient
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0x99ffffff),
          Color(0x33ffffff),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.pie_chart,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Calories",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "1250 kcal",
              style: valuesStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget createStepGlass(TextStyle valuesStyle) {
    return GlassmorphicContainer(
      width: Get.width / 3.5, // Width of the container
      height: Get.height / 6, // Height of the container
      borderRadius: 20, // Border radius of the container
      linearGradient: const LinearGradient(
        // Background gradient
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color.fromARGB(255, 255, 0, 0),
          Color.fromARGB(255, 255, 115, 0),
        ],
      ),
      border: 2, // Border width
      blur: 10, // Gaussian blur
      borderGradient: const LinearGradient(
        // Border gradient
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0x99ffffff),
          Color(0x33ffffff),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.directions_run,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Steps",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "0",
              style: valuesStyle,
            )
          ],
        ),
      ),
    );
  }

  Widget createAppBar() {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: orangeCustom,
          radius: Get.width / 18,
          backgroundImage: const AssetImage(
            "assets/logo.png",
          ),
        ),
        SizedBox(
          width: Get.width / 20,
        ),
        SizedBox(
          width: Get.width / 2,
          child: Text(
            "Welcome ReflectIqBusiness",
            style: Get.textTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
          ),
        )
      ],
    );
  }
}
