import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants/apptheme.dart';
import 'login_signinscreen.dart';

class Onboarding extends ConsumerStatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends ConsumerState<Onboarding>
    with TickerProviderStateMixin {
  int _currentPage = 0;
  final apptheme = AppTheme();
  final controller = PageController(); //PageView Controller

  final List<OnboardingPage> _pages = [
    //The List of Pages
    OnboardingPage(
      imagePath: 'assets/gif/plates.gif',
      title: 'Create Your Own Plate',
      description:
          'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
    ),
    OnboardingPage(
      imagePath: 'assets/gif/SecondFix.gif',
      title: 'Exquisite Catering',
      description:
          'Experience culinary artistry like never before with our innovative and exquisite cuisine creations.',
    ),
    OnboardingPage(
      imagePath: 'assets/gif/Third.gif',
      title: 'Personal Order Executive',
      description:
          'Embark on a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
    ),
  ];

  void _goToNextPage() {
    //Function that runs when next is clicked
    if (_currentPage < _pages.length - 1) {
      controller.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      // Handle onboarding completed
    }
  }

  void _onDotClicked(int index) {
    //Function that runs when dots are clicked
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Column(
        children: [
          GestureDetector(
            onTap: () => _onDotClicked(_pages.length - 1),
            child: Container(
              margin: EdgeInsets.only(
                top: 41.0,
                right: MediaQuery.of(context).size.width *
                    0.05, // Increase the size according to the screen size, on larger screens the design looked too small
              ),
              child: Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: 56 * 1.2, // Increase the width by 1.2
                  height: 22 * 1.2, // Increase the height by 1.2
                  padding: const EdgeInsets.symmetric(
                    horizontal:
                        13 * 1.2, // Increase the horizontal padding by 1.2
                    vertical: 2 * 1.2, // Increase the vertical padding by 1.2
                  ),
                  clipBehavior: Clip.antiAlias,
                  decoration: ShapeDecoration(
                    color: const Color(0xFFE8E0EA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Opacity(
                        opacity: 0.75,
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: Color(0xFF6318AF),
                            fontSize: 14 * 1.2, // Increase the font size by 1.2
                            fontFamily: 'Lexend',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: PageView.builder(
              controller: controller,
              itemCount: _pages.length,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemBuilder: (context, currentPage) {
                final page = _pages[currentPage];
                return Scaffold(
                  body: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        page.imagePath,
                        width: 315,
                        height: 185,
                      ),
                      const SizedBox(
                        height: 23,
                      ),
                      Text(
                        page.title,
                        textAlign: TextAlign.center,
                        style: apptheme.appfonttheme(
                            fontSize: 25, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 16.0),
                      Container(
                        margin: const EdgeInsets.only(left: 25, right: 25),
                        child: Text(
                          page.description,
                          textAlign: TextAlign.center,
                          style: apptheme.appfonttheme(
                              fontSize: 16, fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 48.0),
          SmoothPageIndicator(
            //Current Page indicator
            controller: controller,
            onDotClicked: (index) => _onDotClicked(index),
            count: _pages.length,
            effect: const SwapEffect(
              dotWidth: 24,
              dotHeight: 8,
              dotColor: Colors.grey,
              activeDotColor: Color(0xFF6318AF),
              spacing: 8,
              strokeWidth: 1.5,
            ),
          ),
          const SizedBox(height: 24.0),
          GestureDetector(
            onTap: _goToNextPage,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: _currentPage < _pages.length - 1
                  ? 60
                  : 180, //Change Width According to index
              height: 60,
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                color: const Color(0xFFE0D4EC),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    left: _currentPage < _pages.length - 1
                        ? 9
                        : 130, //Change the Position of the Arrow if Last page
                    top: 9,
                    child: Container(
                      width: 42,
                      height: 42,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF6017AA),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 0.50, color: Colors.white),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            left: 6,
                            top: 6,
                            child: Container(
                              width: 31,
                              height: 30,
                              clipBehavior: Clip.antiAlias,
                              decoration: const BoxDecoration(),
                              child: Stack(children: [
                                SvgPicture.asset(
                                    'assets/icons/arrow-sm-right.svg')
                              ]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _currentPage < _pages.length - 1
                      ? const SizedBox.shrink()
                      : Positioned(
                          left: 30,
                          top: 20,
                          child: InkWell(
                            onTap: () => {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: ((context) =>
                                          const LoginSignup())))
                            },
                            child: Text(
                              'Get Started',
                              style: apptheme.appfonttheme(
                                color: const Color(0xFF6318AF),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ), //Render the GetStarted if Last page
                ],
              ),
            ),
          ),
          const SizedBox(height: 24.0),
        ],
      ),
    );
  }
}

class OnboardingPage {
  final String imagePath;
  final String title;
  final String description;

  OnboardingPage({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}
