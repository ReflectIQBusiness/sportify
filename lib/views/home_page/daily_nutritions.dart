import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';
import 'package:sportapplication/models/ingredient.dart';
import 'package:sportapplication/views/home_page/add_element.dart';

class DailyNutritions extends StatelessWidget {
  const DailyNutritions({
    super.key,
    required this.homePageController,
  });

  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final ingredients = homePageController.ingredients
          .where((p0) =>
              p0.mealId == homePageController.meals.firstWhere((element) => element['isSelected'])['id'] &&
              (p0.dateTime.day == homePageController.selectedDate.value.day &&
                  p0.dateTime.month == homePageController.selectedDate.value.month &&
                  p0.dateTime.year == homePageController.selectedDate.value.year))
          .toList();
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width / 20),
        child: Column(
          children: [
            createTopPadding(),
            createAppBar(context),
            createDivider(),
            createDateTimeLine(),
            createDivider(),
            createChips(),
            createDivider(),
            createListIngredients(ingredients)
          ],
        ),
      );
    });
  }

  SizedBox createTopPadding() {
    return SizedBox(
      height: Get.height / 14,
    );
  }

  SizedBox createDivider() {
    return const SizedBox(
      height: 20,
    );
  }

  Widget createListIngredients(List<Ingredient> ingredients) {
    return Expanded(
      child: (ingredients.isNotEmpty)
          ? ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final ingredient = ingredients[index];
                final totalMacro = ingredient.protein + ingredient.fat + ingredient.carbs;
                return Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Get.height / 50,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.1),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      createListTileIngredient(ingredient),
                      SizedBox(
                        height: Get.height / 50,
                      ),
                      createListMacros(ingredient, totalMacro)
                    ],
                  ),
                );
              },
              itemCount: ingredients.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 20,
                );
              },
            )
          : createEmptyIngredients(),
    );
  }

  Widget createListMacros(Ingredient ingredient, double totalMacro) {
    return Wrap(
      direction: Axis.horizontal,
      children: [
        SizedBox(
          height: Get.height / 20,
          child: RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(
              value: ingredient.protein / totalMacro,
              backgroundColor: Colors.grey.withOpacity(0.1),
              color: Colors.green,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${ingredient.protein}g",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Protein",
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
        SizedBox(
          width: Get.width / 5,
        ),
        SizedBox(
            height: Get.height / 20,
            child: RotatedBox(
              quarterTurns: -1,
              child: LinearProgressIndicator(
                value: ingredient.fat / totalMacro,
                backgroundColor: Colors.grey.withOpacity(0.1),
                color: Colors.red,
              ),
            )),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${ingredient.fat}g",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Fat",
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
        SizedBox(
          width: Get.width / 5,
        ),
        SizedBox(
          height: Get.height / 20,
          child: RotatedBox(
            quarterTurns: -1,
            child: LinearProgressIndicator(
              value: ingredient.carbs / totalMacro,
              backgroundColor: Colors.grey.withOpacity(0.1),
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${ingredient.carbs}g",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Carbs",
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget createEmptyIngredients() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          'assets/empty.svg',
          width: Get.width / 5,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "No ingredients found for this meal, please add some ingredients to your meal to embrace the power of nutrition. 🥗 ",
          style: TextStyle(
            color: Colors.grey,
            fontSize: Get.width / 35,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget createListTileIngredient(Ingredient ingredient) {
    return ListTile(
      leading: Container(
        width: Get.width / 6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          image: DecorationImage(
            image: NetworkImage(ingredient.image),
            fit: BoxFit.cover,
          ),
        ),
      ),
      title: Text(ingredient.name),
      subtitle: Text("🔥 ${ingredient.calories} cal • ${ingredient.quantity} ${ingredient.unit}"),
      trailing: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.ellipsis,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget createChips() {
    return Container(
      height: Get.height / 20,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
        borderRadius: BorderRadius.circular(100),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: Get.width / 150,
      ),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final meal = homePageController.meals[index];
          return GestureDetector(
            onTap: () {
              homePageController.changeMeal(index);
            },
            child: Chip(
              label: Text(meal['name']),
              backgroundColor: meal['isSelected'] ? Colors.white : Colors.grey.withOpacity(0.05),
              labelStyle: TextStyle(
                fontWeight: meal['isSelected'] ? FontWeight.bold : FontWeight.normal,
              ),
              shadowColor: meal['isSelected'] ? Colors.black.withOpacity(0.2) : Colors.transparent,
              side: BorderSide.none,
              elevation: meal['isSelected'] ? 3 : 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100),
                side: BorderSide(
                  color: orangeCustom,
                ),
              ),
            ),
          );
        },
        itemCount: homePageController.meals.length,
        separatorBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 60,
              vertical: Get.height / 100,
            ),
            child: IntrinsicHeight(
              child: VerticalDivider(
                color: Colors.black.withOpacity(0.1),
                thickness: 1,
                width: 1,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget createDateTimeLine() {
    return EasyDateTimeLine(
      initialDate: homePageController.selectedDate.value,
      onDateChange: (selectedDate) {
        homePageController.changeDate(selectedDate);
      },
      headerProps: const EasyHeaderProps(
        monthPickerType: MonthPickerType.switcher,
        selectedDateFormat: SelectedDateFormat.fullDateDMY,
      ),
      dayProps: const EasyDayProps(
        dayStructure: DayStructure.dayStrDayNum,
        activeDayStyle: DayStyle(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 255, 0, 0),
                Color.fromARGB(255, 255, 115, 0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget createAppBar(BuildContext context) {
    return Row(
      children: [
        Text(
          "Daily\nNutritions",
          style: Theme.of(context).textTheme.headlineLarge!,
        ),
        const Spacer(),
        createAddAndCalendarBtn(),
      ],
    );
  }

  Widget createAddAndCalendarBtn() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.toNamed(AddElement.routeName);
            },
            icon: SvgPicture.asset(
              'assets/add.svg',
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/calendar.svg',
            ),
          ),
        ],
      ),
    );
  }
}
