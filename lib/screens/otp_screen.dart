import 'package:craftui/constants/apptheme.dart';
import 'package:craftui/screens/letstartscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../components/appbar.dart';

class Otp extends ConsumerStatefulWidget {
  Otp({
    super.key,
    required this.phoneno,
    required this.verificationId,
  });
  final String phoneno;
  String verificationId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpState();
}

class _OtpState extends ConsumerState<Otp> {
  String pin = "";

  Future<void> signInWithPhoneNumber(String smsCode) async {
    try {
      // Create a PhoneAuthCredential with the code
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verificationId,
        smsCode: smsCode,
      );

      // Sign the user in with the credential
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => LetsStart(
                        phoneno: widget.phoneno,
                      ))));

      // User successfully signed in
    } catch (e) {
      // Handle sign-in failure
      print('Sign-in failed: $e');
    }
  }

  Future<void> resendOtp() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    await auth.verifyPhoneNumber(
      phoneNumber: widget.phoneno,
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        print('Failed to resend OTP: $e');
      },
      codeSent: (String verificationId, int? resendToken) {
        widget.verificationId = verificationId;
        print('OTP Resent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    return Scaffold(
      backgroundColor: const Color(0xfff7f6f0),
      appBar: const AppbarCustom(
        title: "OTP Verification",
        color: 0xfff7f6f0,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 24,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              "We have sent a verification code to",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "+91-${widget.phoneno.length >= 4 ? "X" * (widget.phoneno.length - 4) + widget.phoneno.substring(widget.phoneno.length - 4) : "X" * widget.phoneno.length}",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                child: SvgPicture.asset(
                  "assets/icons/verified_black_24dp 2.svg",
                ),
              )
            ],
          ),
          const SizedBox(
            height: 44,
          ),
          OTPTextField(
            length: 6,
            spaceBetween: 10,
            onChanged: (_) => {},
            otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white),
            width: MediaQuery.of(context).size.width * 0.98,
            fieldWidth: 50,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            inputFormatter: const [],
            onCompleted: (pin) async {
              setState(() {
                pin = pin;
              });
              await signInWithPhoneNumber(pin);
            },
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 44,
            width: 360,
            child: Container(
              alignment: Alignment.center,
              decoration: ShapeDecoration(
                color: const Color(0xFF6318AF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: TextButton(
                onPressed: () => signInWithPhoneNumber(pin),
                child: Text(
                  "Submit",
                  style: AppTheme().appfonttheme(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Didn't receive code?",
                    style: AppTheme().appfonttheme(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 0.50,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      resendOtp();
                    },
                    child: Text(
                      "Resend Again.",
                      style: AppTheme().appfonttheme(
                        color: const Color(0xFF6318AF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
