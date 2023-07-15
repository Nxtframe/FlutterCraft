import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';

import '../components/appbar.dart';

class Otp extends ConsumerStatefulWidget {
  const Otp({super.key, required this.phoneno});
  final String phoneno;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OtpState();
}

class _OtpState extends ConsumerState<Otp> {
  @override
  Widget build(BuildContext context) {
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
            child: Text("We have sent a verification code to",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                )),
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
                      "assets/icons/verified_black_24dp 2.svg"),
                )
              ]),
          const SizedBox(
            height: 44,
          ),
          OTPTextField(
            length: 4,
            spaceBetween: 20,
            onChanged: (_) => {},
            otpFieldStyle: OtpFieldStyle(backgroundColor: Colors.white),
            width: MediaQuery.of(context).size.width * 0.8,
            fieldWidth: 50,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 17),
            textFieldAlignment: MainAxisAlignment.spaceAround,
            fieldStyle: FieldStyle.underline,
            inputFormatter: const [],
            onCompleted: (pin) {
              print("Completed: $pin");
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
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: Text("Submit",
                  style: AppTheme().appfonttheme(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400)),
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
                        letterSpacing: 0.50),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Resent Again.",
                      style: AppTheme().appfonttheme(
                        color: const Color(0xFF6318AF),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  )
                ], // Note for future refactor Text to make it dryier
              ),
            ),
          )
        ],
      ),
    );
  }
}
