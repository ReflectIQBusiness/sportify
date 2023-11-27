import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:sportapplication/constants/colors.dart';
import 'package:sportapplication/controller/privacy_controller.dart';

class PrivacyPolicy extends StatelessWidget {
  final PrivacyController privacyController = Get.put(PrivacyController());
  static const routeName = "/privacy-policy";
  PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: createAppBar(),
          body: Column(children: [
            createRowOfChoice(),
            createPercentOfReading(),
            createBody(),
          ]),
        ));
  }

  Widget createBody() {
    return Expanded(
      child: SingleChildScrollView(
        controller: privacyController.scrollController.value,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: Get.height / 30,
          ),
          child: privacyController.isPrivacy.value ? createPrivacyPolicyHtmlWidget() : createTermsOfUseHtmlWidget(),
        ),
      ),
    );
  }

  Widget createPercentOfReading() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 1.0),
      child: LinearPercentIndicator(
        lineHeight: 5.0,
        padding: EdgeInsets.zero,
        percent: privacyController.percentScroll.value,
        backgroundColor: Colors.grey.withOpacity(0.2),
        progressColor: orangeCustom,
      ),
    );
  }

  AppBar createAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Text("Privacy & Terms",
          style: TextStyle(
            fontSize: Get.width / 20,
            fontWeight: FontWeight.w600,
          )),
    );
  }

  Widget createRowOfChoice() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: Get.height / 40,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: orangeCustom.withOpacity(0.2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            createContainerPrivacy(),
            SizedBox(
              width: Get.width / 20,
            ),
            createContainerTerms(),
          ],
        ),
      ),
    );
  }

  GestureDetector createContainerPrivacy() {
    return GestureDetector(
      onTap: () => privacyController.changePrivacy(),
      child: Container(
        width: Get.width / 2.5,
        height: Get.height / 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: privacyController.isPrivacy.value ? orangeCustom : Colors.transparent,
        ),
        child: Center(
          child: Text(
            "Privacy Policy",
            style: TextStyle(
              fontSize: Get.width / 30,
              fontWeight: FontWeight.w600,
              color: privacyController.isPrivacy.value ? Colors.white : orangeCustom,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector createContainerTerms() {
    return GestureDetector(
      onTap: () => privacyController.changeTerms(),
      child: Container(
        width: Get.width / 2.5,
        height: Get.height / 20,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: privacyController.isPrivacy.value ? Colors.transparent : orangeCustom,
        ),
        child: Center(
          child: Text(
            "Terms of Use",
            style: TextStyle(
              fontSize: Get.width / 30,
              fontWeight: FontWeight.w600,
              color: privacyController.isTerms.value ? Colors.white : orangeCustom,
            ),
          ),
        ),
      ),
    );
  }

  Widget createPrivacyPolicyHtmlWidget() {
    return const HtmlWidget(r'''
                <h1>Privacy Policy</h1>
<p>Effective date: September 14, 2021</p>
<p>Sport Application ("us", "we", or "our") operates the Sport Application mobile application (hereinafter referred to as the "Service").</p>
<p>This page informs you of our policies regarding the collection, use, and disclosure of personal data when you use our Service and the choices you have associated with that data.</p>
<p>We use your data to provide and improve the Service. By using the Service, you agree to the collection and use of information in accordance with this policy.</p>
<p>Unless otherwise defined in this Privacy Policy, the terms used in this Privacy Policy have the same meanings as in our Terms and Conditions.</p>
<h2>Definitions</h2>
<ul>
  <li>
      <p><strong>Service</strong></p>
              <p>Service is the Sport Application mobile application operated by Sport Application</p>
          </li>
  <li>
      <p><strong>Personal Data</strong></p>
      <p>Personal Data means data about a living individual who can be identified from those data (or from those and other information either in our possession or likely to come into our possession).</p>
  </li>
  <li>
      <p><strong>Usage Data</strong></p>
      <p>Usage Data is data collected automatically either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).</p>
  </li>
  <li>
      <p><strong>Cookies</strong></p>
      <p>Cookies are small files stored on your device (computer or mobile device).</p>
  </li>
</ul>
<h2>Information Collection and Use</h2>
<p>We collect several different types of information for various purposes to provide and improve our Service to you.</p>
<h3>Types of Data Collected</h3>
<h4>Personal Data</h4>
<p>While using our Service, we may ask you to provide us with certain personally identifiable information that can be used to contact or identify you ("Personal Data"). Personally identifiable information may include, but is not limited to:</p>
<ul>
  <li>Usage Data</li>
</ul>
<h4>Usage Data</h4>
<p>When you access the Service by or through a mobile device, we may collect certain information automatically, including, but not limited to, the type of mobile device you use, your mobile device unique ID, the IP address of your mobile device, your mobile operating system, the type of mobile Internet browser you use, unique device identifiers and other diagnostic data ("Usage Data").</p>
<h4>Tracking &amp; Cookies Data</h4>
<p>We use cookies and similar tracking technologies to track the activity on our Service and we hold certain information.</p>
<p>Cookies are files with a small amount of data which may include an anonymous unique identifier. Cookies are sent to your browser from a website and stored on your device. Other tracking technologies are also used such as beacons, tags and scripts to collect and track information and to improve and analyze our Service.</p>
<p>You can instruct your browser to refuse all cookies or to indicate when a cookie is being sent. However, if you do not accept cookies, you may not be able to use some portions of our Service.</p>
<p>Examples of Cookies we use:</p>
<ul>
  <li><strong>Session Cookies.</strong> We use Session Cookies to operate our Service.</li>
  <li><strong>Preference Cookies.</strong> We use Preference Cookies to remember your preferences and various settings.</li>
  <li><strong>Security Cookies.</strong> We use Security Cookies for security purposes.</li>
</ul>
<h2>Use of Data</h2>
<p>Sport Application uses the collected data for various purposes:</p>
<ul>
  <li>To provide and maintain our Service</li>
  <li>To notify you about changes to our Service</li>
  <li>To allow you to participate in interactive features of our Service when you choose to do so</li>
  <li>To provide customer support</li>
  <li>To gather analysis or valuable information so that we can improve our Service</li>
  <li>To monitor the usage of our Service</li>
  <li>To detect, prevent and address technical issues</li>
  <li>To provide you with news, special offers and general information about other goods, services and events which we offer that are similar to those that you have already purchased or enquired about unless you have opted not to receive such information</li>
</ul>
                ''');
  }

  Widget createTermsOfUseHtmlWidget() {
    return const HtmlWidget(r'''
                <h1>Terms and Conditions</h1>
<p>Last updated: September 14, 2021</p>
<p>Please read these terms and conditions carefully before using Our Service.</p>
<h2>Interpretation and Definitions</h2>
<h3>Interpretation</h3>
<p>The words of which the initial letter is capitalized have meanings defined under the following conditions.</p>
<p>The following definitions shall have the same meaning regardless of whether they appear in singular or in plural.</p>
<h3>Definitions</h3>
<p>For the purposes of these Terms and Conditions:</p>
<ul>
  <li>
      <p><strong>Affiliate</strong></p>
      <p>means an entity that controls, is controlled by or is under common control with a party, where "control" means ownership of 50% or more of the shares, equity interest or other securities entitled to vote for election of directors or other managing authority.</p>
  </li>
  <li>
      <p><strong>Country</strong></p>
      <p>refers to: Morocco</p>
  </li>
  <li>
      <p><strong>Company</strong> (referred to as either "the Company", "We", "Us" or "Our" in this Agreement) refers to Sport Application.</p>
      <p>For the purpose of the GDPR, the Company is the Data Controller.</p>
  </li>
  <li>
      <p><strong>Device</strong></p>
      <p>means any device that can access the Service such as a computer, a cellphone or a digital tablet.</p>
  </li>
  <li>
      <p><strong>Service</strong></p>
      <p>refers to the Application.</p>
  </li>
  <li>
      <p><strong>Terms and Conditions</strong> (also referred as "Terms") mean these Terms and Conditions that form the entire agreement between You and the Company regarding the use of the Service.</p>
  </li>
  <li>
      <p><strong>Third-party Social Media Service</strong></p>
      <p>means any services or content (including data, information, products or services) provided by a third-party that may be displayed, included or made available by the Service.</p>
  </li>
  <li>
      <p><strong>Website</strong></p>
      <p>refers to Sport Application, accessible from <a href="https://sportapplication.com" rel="external nofollow noopener" target="_blank">https://sportapplication.com</a></p>
  </li>
  <li>
      <p><strong>You</strong></p>
      <p>means the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.</p>
      <p>Under GDPR (General Data Protection Regulation), You can be referred to as the Data Subject or as the User as you are the individual using the Service.</p>
  </li>
</ul>
<h2>Acknowledgment</h2>
<p>These are the Terms and Conditions governing the use of this Service and the agreement that operates between You and the Company. These Terms and Conditions set out the rights and obligations of all users regarding the use of the Service.</p>
<p>Your access to and use of the Service is conditioned on Your acceptance of and compliance with these Terms and Conditions. These Terms and Conditions apply to all visitors, users and others who access or use the Service.</p>
<p>By accessing or using the Service You agree to be bound by these Terms and Conditions. If You disagree with any part of these Terms and Conditions then You may not access the Service.</p>
<p>You represent that you are over the age of 18. The Company does not permit those under 18 to use the Service.</p>
<p>Your access to and use of the Service is also conditioned on Your acceptance of and compliance with the Privacy Policy of the Company. Our Privacy Policy describes Our policies and procedures on the collection, use and disclosure of Your personal information when You use the Application or the Website and tells You about Your privacy rights and how the law protects You. Please read Our Privacy Policy carefully before using Our Service.</p>
<h2>Links to Other Websites</h2>
<p>Our Service may contain links to third-party web sites or services that are not owned or controlled by the Company.</p>
<p>The Company has no control over, and assumes no responsibility for, the content, privacy policies, or practices of any third party web sites or services. You further acknowledge and agree that the Company shall not be responsible or liable, directly or indirectly, for any damage or loss caused or alleged to be caused by or in connection with the use of or reliance on any such content, goods or services available on or through any such web sites or services.</p>
<p>We strongly advise You to read the terms and conditions and privacy policies of any third-party web sites or services that You visit.</p>
<h2>Termination</h2>
<p>We may terminate or suspend Your access immediately, without prior notice or liability, for any reason whatsoever, including without limitation if You breach these Terms and Conditions.</p>
<p>Upon termination, Your right to use the Service will cease immediately.</p>
<h2>Limitation of Liability</h2>
<p>Notwithstanding any damages that You might incur, the entire liability of the Company and any of its suppliers under any provision of this Terms and Your exclusive remedy for all of the foregoing shall be limited to the amount actually paid by You through the Service or 100 USD if You haven't purchased anything through the Service.</p>
<p>To the maximum extent permitted by applicable law, in no event shall the Company or its suppliers be liable for any special, incidental, indirect, or consequential damages whatsoever (including, but not limited to, damages for loss of profits, loss of data or other information, for business interruption, for personal injury, loss of privacy arising out of or in any way related to the use of or inability to use the Service, third-party software and/or third-party hardware used with the Service, or otherwise in connection with any provision of this Terms), even if the Company or any supplier has been advised of the possibility of such damages and even if the remedy fails of its essential purpose.</p>
<p>Some states do not allow the exclusion of implied warranties or limitation of liability for incidental or consequential damages, which means that some of the above limitations may not apply. In these states, each party's liability will be limited to the greatest extent permitted by law.</p>
<h2>"AS IS" and "AS AVAILABLE" Disclaimer</h2>
<p>The Service is provided to You "AS IS" and "AS AVAILABLE" and with all faults and defects without warranty of any kind. To the maximum extent permitted under applicable law, the Company, on its own behalf and on behalf of its Affiliates and its and their respective licensors and service providers, expressly disclaims all warranties, whether express, implied, statutory or otherwise, with respect to the Service, including all implied warranties of merchantability, fitness for a particular purpose, title and non-infringement, and warranties that may arise out of course of dealing, course of performance, usage or trade practice. Without limitation to the foregoing, the Company provides no warranty or undertaking, and makes no representation of any kind that the Service will meet Your requirements, achieve any intended results, be compatible or work with any other software, applications, systems or services, operate without interruption, meet any performance or reliability standards or be error free or that any errors or defects can or will be corrected.</p>
<p>Without limiting the foregoing, neither the Company nor any of the company's provider makes any representation or warranty of any kind, express or implied: (i) as to the operation or availability of the Service, or the information, content, and materials or products included thereon; (ii) that the Service will be uninterrupted or error-free; (iii) as to the accuracy, reliability, or currency of any information or content provided through the Service; or (iv) that the Service, its servers, the content, or e-mails sent from or on behalf of the Company are free of viruses, scripts, trojan horses, worms, malware, timebombs or other harmful components.</p>
<p>Some jurisdictions do not allow the exclusion of certain types of warranties or limitations on applicable statutory rights of a consumer, so some or all of the above exclusions and limitations may not apply to You. But in such a case the exclusions and limitations set forth in this section shall be applied to the greatest extent enforceable under applicable law.</p>
<h2>Governing Law</h2>
<p>The laws of the Country, excluding its conflicts of law rules, shall govern this Terms and Your use of the Service. Your use of the Application may also be subject to other local, state, national, or international laws.</p>
<h2>Disputes Resolution</h2>
<p>If You have any concern or dispute about the Service, You agree to first try to resolve the dispute informally by contacting the Company.</p>
<h2>For European Union (EU) Users</h2>
<p>If You are a European Union consumer, you will benefit from any mandatory provisions of the law of the country in which you are resident in.</p>
<h2>United States Legal Compliance</h2>
''');
  }
}
// Obx(() => Scaffold(
//           appBar: createAppBar(),
//           body: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             // ignore: prefer_const_literals_to_create_immutables
//             children: <Widget>[
//               createRowOfChoice(),
//               createPercentOfReading(),
//               createBody(),
//             ],
//           ),
//         ));