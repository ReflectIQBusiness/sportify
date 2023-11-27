import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUS extends StatelessWidget {
  const ContactUS({super.key});
  static const routeName = "/contact-us";
  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(
      fontSize: Get.width / 35,
      color: Colors.black.withOpacity(0.6),
    );
    var edgeInsets = EdgeInsets.only(left: Get.width / 18, right: Get.width / 18, top: Get.width / 30);
    return Scaffold(
      appBar: createAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: edgeInsets,
          child: Column(children: [
            createContactUsDescription(),
            createSpacer(),
            createSupportCard(textStyle),
            createSpacer(),
            createSocialMediaCard(textStyle),
            createSpacer(),
            createLogo()
          ]),
        ),
      ),
    );
  }

  Widget createLogo() {
    return Image.asset(
      "assets/logo.png",
      width: Get.width / 2,
    );
  }

  Widget createSpacer() {
    return SizedBox(
      height: Get.height / 20,
    );
  }

  Widget createContactUsDescription() {
    return Text(
      "you can get in touch with us through below platforms. Our team will reach out to you as soon as it would be possible",
      style: TextStyle(
        fontSize: Get.width / 32,
      ),
    );
  }

  Widget createSocialMediaCard(TextStyle textStyle) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          Text(
            "Social Media",
            style: TextStyle(fontSize: Get.width / 23, fontWeight: FontWeight.w600),
          ),
          createInstagramRow(textStyle),
          createSpacerHeight(),
          createFacebookRow(textStyle),
          createSpacerHeight(),
          createTwitterRow(textStyle),
          createSpacerHeight(),
        ],
      ),
    );
  }

  Widget createSupportCard(TextStyle textStyle) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      child: Column(
        children: [
          Text(
            "Customer Support",
            style: TextStyle(fontSize: Get.width / 23, fontWeight: FontWeight.w600),
          ),
          createPhoneRow(textStyle),
          createSpacerHeight(),
          createEmailRow(textStyle),
          createSpacerHeight(),
        ],
      ),
    );
  }

  Widget createSpacerHeight() {
    return const SizedBox(
      height: 10,
    );
  }

  Widget createTwitterRow(TextStyle textStyle) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 30, top: Get.width / 30),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/twitter.svg",
            width: Get.width / 12,
          ),
          SizedBox(
            width: Get.width / 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Twitter",
                style: textStyle,
              ),
              const Text("@reflectiqtwin"),
            ],
          )
        ],
      ),
    );
  }

  Widget createFacebookRow(TextStyle textStyle) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 30, top: Get.width / 30),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/facebook1.svg",
            width: Get.width / 12,
          ),
          SizedBox(
            width: Get.width / 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Facebook",
                style: textStyle,
              ),
              const Text("@reflectiqtwin"),
            ],
          )
        ],
      ),
    );
  }

  Widget createInstagramRow(TextStyle textStyle) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 30, top: Get.width / 30),
      child: Row(
        children: [
          SvgPicture.asset(
            "assets/instagram.svg",
            width: Get.width / 12,
          ),
          SizedBox(
            width: Get.width / 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Instagram",
                style: textStyle,
              ),
              const Text("@reflectiqtwin"),
            ],
          )
        ],
      ),
    );
  }

  Widget createEmailRow(TextStyle textStyle) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 30, top: Get.width / 30),
      child: InkWell(
        onTap: () {
          launchUrl(Uri(
            scheme: 'mailto',
            path: 'reflectiqbusiness@gmail.com',
          ));
        },
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: orangeCustom),
              ),
              child: Icon(CupertinoIcons.mail, color: orangeCustom),
            ),
            SizedBox(
              width: Get.width / 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email",
                  style: textStyle,
                ),
                const Text("reflectiqbusiness@gmail.com"),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget createPhoneRow(TextStyle textStyle) {
    return Padding(
      padding: EdgeInsets.only(left: Get.width / 30, top: Get.width / 30),
      child: InkWell(
        onTap: () {
          launchUrl(
            Uri(
              scheme: 'tel',
              path: '+21200000000',
            ),
          );
        },
        child: Row(children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: orangeCustom),
            ),
            child: Icon(
              CupertinoIcons.phone,
              color: orangeCustom,
            ),
          ),
          SizedBox(
            width: Get.width / 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phone Number",
                style: textStyle,
              ),
              const Text("+21200000000"),
            ],
          )
        ]),
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
        title: Text(
      "Contact Us",
      style: TextStyle(
        color: Colors.black,
        fontSize: Get.width / 20,
        fontWeight: FontWeight.bold,
      ),
    ));
  }
}
