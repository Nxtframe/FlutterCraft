import 'package:craftui/components/leftcloud.dart';
import 'package:craftui/components/rightcloud.dart';
import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final appTheme = AppTheme();

    return Scaffold(
      backgroundColor: appTheme.splashscreenbg,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 12), // Adjust the left padding as needed
                    child: SvgPicture.asset(
                      'assets/Logo.svg',
                      width: 88,
                      height: 100,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Text(
                    "Welcome",
                    style: appTheme.welcomefont(
                      fontSize: 32,
                      color: const Color.fromARGB(255, 247, 229, 183),
                    ),
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
          const Align(
            alignment: Alignment.topRight,
            child: RightCloudComponent(),
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: LeftCloudComponent(),
          ),
        ],
      ),
    );
  }
}
