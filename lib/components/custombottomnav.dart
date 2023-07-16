import 'package:craftui/components/my_flutter_app.dart';
import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 20,
      child: SizedBox(
        height: 70, // Adjust the height as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Left items
            Row(
              children: [
                const SizedBox(
                  width: 15,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: FaIcon(
                        FontAwesomeIcons.home,
                        color: AppTheme().splashscreenbg,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      color: _currentIndex == 0
                          ? AppTheme().splashscreenbg
                          : Colors.black,
                    ),
                    const Text(
                      "Home",
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: const FaIcon(
                        FontAwesomeIcons.heart,
                      ),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                    ),
                    const Text(
                      "Wishlist",
                    )
                  ],
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),

            // Empty space in the middle

            // Right items
            Row(
              children: [
                Column(children: [
                  IconButton(
                    icon: const Icon(MyFlutterApp.dinner_plate__1_),
                    onPressed: () {
                      setState(() {
                        _currentIndex = 2;
                      });
                    },
                    color: _currentIndex == 2 ? Colors.blue : Colors.black,
                  ),
                  const Text("Orders")
                ]),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset("assets/icons/user-circle.svg"),
                      onPressed: () {
                        setState(() {
                          _currentIndex = 3;
                        });
                      },
                      color: _currentIndex == 3 ? Colors.blue : Colors.black,
                    ),
                    const Text("Profile")
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
