import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/loginscreencloud.dart';
import '../constants/appDimensions.dart';

class LoginSignup extends ConsumerStatefulWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  _LoginSignupState createState() => _LoginSignupState();
}

class _LoginSignupState extends ConsumerState<LoginSignup> {
  final appTheme = AppTheme();

  void launchURL(String url) async {
    //To Launch the Privary and Terms of service in browser
    final Uri url0 = Uri.parse(url);
    if (await canLaunchUrl(
      url0,
    )) {
      await launchUrl(url0, webOnlyWindowName: "Web");
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: AppDimensions.screenWidth(context),
              height: 243,
              child: Stack(
                children: [
                  const Positioned(
                    child: CloudShapeWidget(),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/Logo.svg',
                          height: 107,
                          width: 107,
                        ),
                        const SizedBox(height: 16),
                        Text("CraftMyPlate",
                            style: appTheme.appfonttheme(
                              color: const Color(0xFFFCFFF7),
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                  top: 47 * 1.2,
                  left:
                      24), //Multiply 1.2 because the max height of the Custompaint widget was multipled by 1.2
              alignment: Alignment.centerLeft,
              child: const Text(
                'Login or Signup',
                style: TextStyle(
                  color: Color(0xFF787878),
                  fontSize: 16,
                  fontFamily: 'Lexend',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: IntlPhoneField(
                dropdownTextStyle: appTheme.appfonttheme(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.black),
                showCountryFlag: false,
                countries: countries
                    .where((country) => country.name == 'India')
                    .toList(),
                decoration: InputDecoration(
                  hintStyle: appTheme.appfonttheme(
                      color: const Color(0xFFAAAAAA),
                      fontWeight: FontWeight.w400),
                  labelText: 'Enter Phone Number',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(
                        6)), // Adjust the radius as per your preference
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                },
              ),
            ),
            SizedBox(
              height: 77,
              child: Container(
                margin: const EdgeInsets.only(right: 24, left: 24, top: 16),
                decoration: ShapeDecoration(
                  color: const Color(0xFF6318AF),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Continue',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        fontFamily: 'Lexend',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              heightFactor: 10,
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text("By continuing, you agree to our",
                      style: appTheme.appfonttheme(
                          fontSize: 13,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xFF7B7B7B))),
                  const SizedBox(height: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          const url =
                              'https://www.google.com/search?q=Terms'; // Replace with your Terms of Service URL
                          launchURL(url);
                        },
                        child: const Text(
                          "Terms of Service",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Color(0xFF7B7B7B),
                          ),
                        ),
                      ),
                      const Text("  "), //Spacing between The Two links
                      GestureDetector(
                          onTap: () {
                            const url =
                                'https://google.com/search?q=privacy'; // Replace with your Privacy Policy URL
                            launchURL(url);
                          },
                          child: const Text(
                            "Privacy Policy",
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Color(0xFF7B7B7B),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
