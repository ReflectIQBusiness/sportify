import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/home_page_controller.dart';

class AddElement extends StatelessWidget {
  static const String routeName = '/add_element';
  HomePageController homePageController = Get.put(HomePageController());
  AddElement({super.key});

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: Get.width / 25,
      color: Colors.grey,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: createAppBar(),
      body: Obx(
        () => InkWell(
          onTap: () => FocusScope.of(context).unfocus(),
          child: (homePageController.searchController.value.text == "")
              ? createEmptySearchFieldWidget(textStyle)
              : (homePageController.foodList.isEmpty && !homePageController.editMode.value)
                  ? createNoFoodFoundWidget(textStyle)
                  : (homePageController.foodList.isNotEmpty && !homePageController.editMode.value)
                      ? createResultsWidget()
                      : createTypingWidget(),
        ),
      ),
    );
  }

  Widget createTypingWidget() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Click enter to search"),
          const SizedBox(height: 50),
          CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation<Color>(orangeCustom),
          ),
        ],
      ),
    );
  }

  Widget createResultsWidget() {
    return Padding(
      padding: EdgeInsets.only(
        top: Get.height / 4.5,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ...homePageController.foodList.map((element) {
            return ListTile(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: Get.width / 15,
                ),
                onTap: () {},
                leading: CircleAvatar(
                  backgroundColor: orangeCustom,
                  child: Text(
                    element['name'].toString().substring(0, 1).toUpperCase(),
                    style: TextStyle(
                      fontSize: Get.width / 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                title: Text(
                  element['name'].toString().toUpperCase(),
                  style: TextStyle(
                    fontSize: Get.width / 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${element['serving_size_g']}g - ${element['calories']}kcal',
                  style: TextStyle(
                    fontSize: Get.width / 30,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.chevron_forward,
                    color: purpleCustom,
                  ),
                ));
          }).toList(),
        ],
      ),
    );
  }

  Widget createNoFoodFoundWidget(TextStyle textStyle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.nosign,
            size: Get.width / 9,
            color: Colors.deepOrange,
          ),
          SizedBox(height: Get.height / 30),
          Text(
            "No food found",
            style: textStyle,
          ),
        ],
      ),
    );
  }

  Widget createEmptySearchFieldWidget(TextStyle textStyle) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.search,
            size: Get.width / 9,
            color: Colors.deepOrange,
          ),
          SizedBox(height: Get.height / 30),
          Text("Please enter a food name to search", style: textStyle),
        ],
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
        title: const Text('Add Element'),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(
            Get.height / 10,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Get.width / 20,
              vertical: Get.height / 60,
            ),
            child: TextFormField(
              controller: homePageController.searchController.value,
              onEditingComplete: () {
                homePageController.searchFoodByName();
              },
              onChanged: (value) {
                homePageController.onChangedSearch(value);
              },
              decoration: InputDecoration(
                hintText: 'Tomato',
                labelText: 'Search...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 0.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: orangeCustom, width: 0.5),
                ),
              ),
            ),
          ),
        ));
  }
  // Scaffold(
  //     extendBodyBehindAppBar: true,
  //     appBar: createAppBar(),
  //     body: Obx(
  //       () => InkWell(
  //           onTap: () => FocusScope.of(context).unfocus(),
  //           child: (homePageController.searchController.value.text == "")
  //               ? createEmptySearchFieldWidget(textStyle)
  //               : (homePageController.foodList.isEmpty && !homePageController.editMode.value)
  //                   ? createNoFoodFoundWidget(textStyle)
  //                   : (homePageController.foodList.isNotEmpty && !homePageController.editMode.value)
  //                       ? createResultsWidget()
  //                       : createTypingWidget()),
  //     ),
  //   );
}
