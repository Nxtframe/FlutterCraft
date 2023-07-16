import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:craftui/components/appbar.dart';
import 'package:craftui/constants/apptheme.dart';
import 'package:craftui/screens/homescreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LetsStart extends ConsumerStatefulWidget {
  const LetsStart({super.key, required this.phoneno});

  final String phoneno;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LetsStartState();
}

class _LetsStartState extends ConsumerState<LetsStart> {
  final apptheme = AppTheme();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _emailid = TextEditingController();

  void _savetoDatabase() async {
    String fullname = _fullname.text;
    String email = _emailid.text;

    // Save to Firestore
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference userRef = await firestore.collection('users').add({
      'fullname': fullname,
      'email': email,
    });

    // Get the current user
    User? currentUser = FirebaseAuth.instance.currentUser;

    // Update display name and email in FirebaseAuth
    if (currentUser != null) {
      try {
        // Update display name
        await currentUser.updateDisplayName(fullname);
        print('Display name updated successfully');

        // Update email
        await currentUser.updateEmail(email);
        print('Email updated successfully');
      } catch (e) {
        print('Failed to update display name and email: $e');
      }
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const Home()));
    }

    // Data saved successfully
  }

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser);
    return Scaffold(
      appBar: const AppbarCustom(title: "", color: 0xFFFFFFF),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, top: 24),
                    child: Text(
                      'Just a step away !',
                      textAlign: TextAlign.center,
                      style: apptheme.appfonttheme(
                        color: const Color(0xFF030303),
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 24, 24, 16),
                  child: Opacity(
                    opacity: 0.7,
                    child: TextField(
                      controller: _fullname,
                      style: apptheme.appfonttheme(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintStyle: apptheme.appfonttheme(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Full name*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFC9C4C9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Opacity(
                  opacity: 0.7,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(20, 0, 24, 16),
                    child: TextField(
                      controller: _emailid,
                      style: apptheme.appfonttheme(
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                      ),
                      decoration: InputDecoration(
                        hintStyle: apptheme.appfonttheme(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                        hintText: "Email ID*",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: const BorderSide(
                            width: 0.5,
                            color: Color(0xFFC9C4C9),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              height: 44,
              width: double.infinity,
              decoration: ShapeDecoration(
                color: const Color(0xFF6318AF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Center(
                child: TextButton(
                  onPressed: _savetoDatabase,
                  child: const Text(
                    "Let's Start",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Lexend',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
