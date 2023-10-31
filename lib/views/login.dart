import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/login_controller.dart';

class Login extends StatelessWidget {
  Login({super.key});
  static const routeName = "/login";
  final LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    TextStyle styleLabel = const TextStyle(color: Colors.black);
    OutlineInputBorder borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 1),
    );
    OutlineInputBorder focusBorderLabel = OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: Colors.black, width: 2),
    );
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          left: Get.width / 20,
          right: Get.width / 20,
          top: Get.height / 10,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Athlete Access",
              style: Get.textTheme.headlineLarge,
            ),
            createDividerSizedBox(),
            Text(
              "Your Gateway to Fitness and Fun",
              style: Get.textTheme.headlineMedium,
            ),
            createDividerSizedBox(),
            Center(
              child: SvgPicture.asset(
                "assets/signin.svg",
                height: Get.height / 4.5,
              ),
            ),
            createDividerSizedBox(),
            createForm(
              styleLabel,
              borderStyle,
              focusBorderLabel,
            ),
            createDividerSizedBox(),
            createForgetPassword(),
            createDividerSizedBox(),
            createOrDivider(),
            createDividerSizedBox(),
            createSocialLogin(),
            createDividerSizedBox(),
            createRegisterChoice(),
            createDividerSizedBox(),
            createLoginButton(),
            createDividerSizedBox(),
          ],
        ),
      ),
    );
  }

  Center createForgetPassword() {
    return Center(
        child: RichText(
            text: TextSpan(style: const TextStyle(color: Colors.black), children: [
      const TextSpan(text: "You forget your password? "),
      TextSpan(
        recognizer: TapGestureRecognizer()..onTap = () => controller.goToForgetPage(),
        text: "help",
        style: const TextStyle(
          decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      ),
    ])));
  }

  Widget createDividerSizedBox() {
    return SizedBox(
      height: Get.height / 30,
    );
  }

  Widget createLoginButton() {
    return ElevatedButton(
      onPressed: () {
        controller.goToHomePage();
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(Get.width, 50),
        backgroundColor: orangeCustom,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        "Login",
        style: TextStyle(color: Colors.white, fontSize: Get.width / 20),
      ),
    );
  }

  Widget createRegisterChoice() {
    return Center(
      child: RichText(
          text: TextSpan(style: const TextStyle(color: Colors.black), children: [
        const TextSpan(text: "You haven't account? "),
        TextSpan(
          recognizer: TapGestureRecognizer()..onTap = () => controller.goToInscription(),
          text: "Register",
          style: const TextStyle(
            decoration: TextDecoration.underline,
            fontWeight: FontWeight.bold,
          ),
        ),
      ])),
    );
  }

  Widget createSocialLogin() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: Get.width / 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/apple.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/facebook.svg"),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/google.svg"),
          ),
        ],
      ),
    );
  }

  Widget createOrDivider() {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Text(' Or '),
        Expanded(child: Divider()),
      ],
    );
  }

  Widget createForm(
    TextStyle styleLabel,
    OutlineInputBorder borderStyle,
    OutlineInputBorder focusBorderLabel,
  ) {
    return Form(
      child: Column(
        children: [
          TextField(
            controller: controller.emailController,
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter your email",
              labelStyle: styleLabel,
              border: borderStyle,
              focusedBorder: focusBorderLabel,
            ),
          ),
          SizedBox(
            height: Get.height / 30,
          ),
          Obx(
            () => TextField(
              controller: controller.passwordController,
              obscureText: !controller.visible.value,
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
                suffixIcon: controller.visible.value
                    ? InkWell(
                        onTap: () {
                          controller.showPassword();
                        },
                        child: const Icon(Icons.visibility_off),
                      )
                    : InkWell(
                        onTap: () {
                          controller.showPassword();
                        },
                        child: const Icon(Icons.visibility),
                      ),
                labelStyle: styleLabel,
                border: borderStyle,
                focusedBorder: focusBorderLabel,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
