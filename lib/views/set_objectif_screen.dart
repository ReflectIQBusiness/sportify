import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/complete_profile_informations_controller.dart';
import 'package:sportapplication/models/step_goal.dart';

class SetObjectifScreen extends StatelessWidget {
  SetObjectifScreen({super.key});
  static const routeName = "/set-objectif-screen";
  final CompleteProfileinformations controller = Get.isRegistered() ? Get.find() : Get.put(CompleteProfileinformations());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            createStepIndicator(),
            SizedBox(
              height: Get.height / 20,
            ),
            createSteps(),
          ],
        ),
        floatingActionButton: (controller.currentStep.value != 1) ? createPrecedentButton() : null,
      ),
    );
  }

  Widget createPrecedentButton() {
    return FloatingActionButton(
      backgroundColor: orangeCustom,
      shape: const CircleBorder(),
      onPressed: () {
        controller.precedent();
      },
      child: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
    );
  }

  Widget createStepIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: Get.height / 40,
        ),
        ...controller.steps.value
            .map((e) => Container(
                  height: 3,
                  width: Get.width / controller.steps.length - 10,
                  color: e.id <= controller.currentStep.value ? orangeCustom : Colors.grey.withOpacity(0.5),
                ))
            .toList()
      ],
    );
  }

  Widget createSteps() {
    return Expanded(
      child: PageView(
        controller: controller.pageController,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        reverse: false,
        children: [
          ...controller.steps.value.map(
            (e) => SingleChildScrollView(
              // Moving this wid
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [createStepWidget(e)],
                  ),
                  SizedBox(
                    height: Get.height / 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget createStepWidget(StepGoal e) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            e.title,
            style: Get.textTheme.displayMedium,
          ),
          SizedBox(
            height: Get.height / 50,
          ),
          Text(
            e.description,
            style: Get.textTheme.headlineMedium,
          ),
          SizedBox(
            height: Get.height / 50,
          ),
          ...e.choices
              .map(
                (e1) => createChoiceWiget(e, e1),
              )
              .toList()
        ],
      ),
    );
  }

  Widget createChoiceWiget(StepGoal e, Choice e1) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () {
          controller.selectChoice(e.id, e1.id);
        },
        child: Container(
          width: Get.width / 1.2,
          height: Get.height / 15,
          decoration: BoxDecoration(
            border: Border.all(
                color: (e1.id == controller.steps.value.firstWhere((element) => element.id == e.id).idChoiceSelected)
                    ? orangeCustom
                    : Colors.grey.withOpacity(0.5)),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              e1.title,
              style: Get.textTheme.titleMedium,
            ),
          ),
        ),
      ),
    );
  }
}
