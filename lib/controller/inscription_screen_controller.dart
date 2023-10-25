import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/views/choose_profile_pic.dart';
import 'package:sportapplication/views/verify_phone.dart';

class InscriptionScreenController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  //controller for textfield pin code
  TextEditingController pin1Controller = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  TextEditingController pin3Controller = TextEditingController();
  TextEditingController pin4Controller = TextEditingController();
  TextEditingController pin5Controller = TextEditingController();
  //focus node for pin code
  FocusNode pin1FocusNode = FocusNode();
  FocusNode pin2FocusNode = FocusNode();
  FocusNode pin3FocusNode = FocusNode();
  FocusNode pin4FocusNode = FocusNode();
  FocusNode pin5FocusNode = FocusNode();

  RxString selectedValue = "men".obs;
  RxString selectedWeightValue = "Kg".obs;
  RxString selectedHeightValue = "Cm".obs;
  Rxn<String> selectedObjectif = Rxn<String>();

  RxBool acceptTerms = false.obs;
  RxBool visible = false.obs;
  RxBool visibleConfirm = false.obs;

  changeSelectedValue(val) {
    selectedValue.value = val;
    selectedValue.refresh();
  }

  changeSelectedWeightValue(val) {
    selectedWeightValue.value = val;
    selectedWeightValue.refresh();
  }

  changeSelectedHeightValue(val) {
    selectedHeightValue.value = val;
    selectedHeightValue.refresh();
  }

  changeSelectedObjectif(val) {
    selectedObjectif.value = val;
    selectedObjectif.refresh();
  }

  changeAcceptTerms() {
    acceptTerms.value = !acceptTerms.value;
    acceptTerms.refresh();
  }

  showPassword() {
    visible.value = !visible.value;
    visible.refresh();
  }

  showPasswordConfirm() {
    visibleConfirm.value = !visibleConfirm.value;
    visibleConfirm.refresh();
  }

  goToVerifyPin() {
    Get.toNamed(VerifyPin.routeName);
  }

  verifyPin(context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: AlertDialog(
                insetPadding: EdgeInsets.symmetric(horizontal: Get.width / 20, vertical: Get.height / 3.5),
                titlePadding: EdgeInsets.zero,
                shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
                title: SizedBox(),
                contentPadding: EdgeInsets.zero,
                surfaceTintColor: Colors.white,
                backgroundColor: Colors.white,
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/success.gif', height: Get.height / 4),
                    SizedBox(
                      width: Get.width / 1.3,
                      child: Text(
                        'Your account has been created successfully, welcome to our app',
                        style: Get.textTheme.bodyLarge,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Get.offAllNamed(ChooseProfilePic.routeName);
                    },
                    child: Text('Continue', style: Get.textTheme.bodyLarge!.copyWith(color: orangeCustom)),
                  ),
                ],
              ),
            ),
          );
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: false,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return SizedBox();
        });
  }
}
