import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
}
