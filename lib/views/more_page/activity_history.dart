import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityHistory extends StatelessWidget {
  static const routeName = "/activity-history";
  const ActivityHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: returnPadding(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              createTitle("Day Streaks"),
              createVerticalTitleSpacer(),
              createCardDailyStreaks(),
              createVerticalTitleSpacer(),
              createTitle("Daily Steps"),
              createVerticalTitleSpacer(),
              createChartLogin(),
              createVerticalTitleSpacer(),
              createTitle("Daily Calories"),
              createVerticalTitleSpacer(),
              createChartDailyCalories(),
            ],
          ),
        ),
      ),
    );
  }

  EdgeInsets returnPadding() {
    return EdgeInsets.symmetric(
      vertical: Get.height / 30,
      horizontal: Get.width / 20,
    );
  }

  Widget createCardDailyStreaks() {
    return Container(
      padding: EdgeInsets.only(
        top: Get.height / 100,
        left: Get.width / 10,
        right: Get.width / 20,
      ),
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.orange.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(5, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("I'm on",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: Get.width / 30,
                    fontWeight: FontWeight.w700,
                  )),
              Text(
                "85",
                style: TextStyle(
                  fontSize: Get.width / 10,
                  color: orangeCustom,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Days Streaks",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Get.width / 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "On Sportify",
                style: TextStyle(
                  color: orangeCustom,
                  fontSize: Get.width / 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: Get.height / 100,
              ),
            ],
          ),
          Transform.rotate(
            angle: -0.6,
            child: SvgPicture.asset(
              "assets/daily.svg",
              fit: BoxFit.fill,
              height: Get.height / 11,
            ),
          ),
        ],
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Activity History",
        style: TextStyle(
          color: Colors.black,
          fontSize: Get.width / 20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget createTitle(String s) {
    return Text(
      s,
      style: TextStyle(
        color: const Color.fromARGB(255, 19, 18, 18),
        fontSize: Get.width / 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget createVerticalTitleSpacer() {
    return SizedBox(
      height: Get.height / 40,
    );
  }

  Widget createChartLogin() {
    return Container(
      height: Get.height / 4,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
        series: <ChartSeries<StepData, String>>[
          LineSeries<StepData, String>(
            dataSource: <StepData>[
              StepData('Mon', 3500),
              StepData('Tue', 2500),
              StepData('Wed', 5000),
              StepData('Thu', 10000),
              StepData('Fri', 5406),
              StepData('Sat', 1000),
              StepData('Sun', 6000),
            ],
            color: orangeCustom,
            markerSettings: MarkerSettings(
              isVisible: true,
              color: orangeCustom,
              shape: DataMarkerType.circle,
            ),

            xValueMapper: (StepData sales, _) => sales.day,
            yValueMapper: (StepData sales, _) => sales.steps,
            // Enable data label
          )
        ],
      ),
    );
  }

  createChartDailyCalories() {
    return Container(
      height: Get.height / 4,
      width: Get.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        // Enable tooltip
        tooltipBehavior: TooltipBehavior(
          enable: true,
        ),
        series: <ChartSeries<StepData, String>>[
          LineSeries<StepData, String>(
            dataSource: <StepData>[
              StepData('Mon', 1200),
              StepData('Tue', 1500),
              StepData('Wed', 1110),
              StepData('Thu', 1250),
              StepData('Fri', 1400),
              StepData('Sat', 2000),
              StepData('Sun', 1350),
            ],
            color: orangeCustom,
            markerSettings: MarkerSettings(
              isVisible: true,
              color: orangeCustom,
              shape: DataMarkerType.circle,
            ),

            xValueMapper: (StepData sales, _) => sales.day,
            yValueMapper: (StepData sales, _) => sales.steps,
            // Enable data label
          )
        ],
      ),
    );
  }
}

class StepData {
  StepData(this.day, this.steps);
  final String day;
  final double steps;
}
// Scaffold(
//       appBar: createAppBar(),
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: returnPadding(),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               createTitle("Day Streaks"),
//               createVerticalTitleSpacer(),
//               createCardDailyStreaks(),
//               createVerticalTitleSpacer(),
//               createTitle("Daily Steps"),
//               createVerticalTitleSpacer(),
//               createChartLogin(),
//               createVerticalTitleSpacer(),
//               createTitle("Daily Calories"),
//               createVerticalTitleSpacer(),
//               createChartDailyCalories(),
//             ],
//           ),
//         ),
//       ),
//     );
