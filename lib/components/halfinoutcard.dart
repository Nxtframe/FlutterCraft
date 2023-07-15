import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HalfInOutCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final apptheme = AppTheme();
  HalfInOutCard({Key? key, required this.imageUrl, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: 200,
      child: Stack(
        children: [
          Positioned(
            left: 20,
            child: Container(
              width: 170,
              height: 150,
              decoration: ShapeDecoration(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFE5E5E5)),
                  borderRadius: BorderRadius.circular(7),
                ),
                shadows: const [
                  BoxShadow(
                    color: Color(0x33000000),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 15,
            left: 0,
            child: PhysicalModel(
              elevation: 4.0,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(75),
              clipBehavior: Clip.antiAlias,
              child: ClipOval(
                child: SizedBox(
                  width: 75,
                  height: 75,
                  child: Image.asset(imageUrl),
                ),
              ),
            ),
          ),
          Positioned(
              top: 5,
              left: 50,
              child: Text(
                title,
                style: apptheme.appfonttheme(
                    fontSize: 12, fontWeight: FontWeight.w500),
              )),
          Positioned(
              top: 30,
              left: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "3 starters ",
                    style: apptheme.appfonttheme(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 36, 36, 36)),
                  ),
                  Text(
                    "3 maincourse",
                    style: apptheme.appfonttheme(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 36, 36, 36)),
                  ),
                  Text(
                    "3 desserts",
                    style: apptheme.appfonttheme(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 36, 36, 36)),
                  ),
                  Text(
                    "3 drinks",
                    style: apptheme.appfonttheme(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 36, 36, 36)),
                  ),
                ], //Making the text static because it a proof of work
              )),
          Positioned(
              bottom: 40,
              left: 50,
              child: Row(
                children: [
                  SvgPicture.asset("assets/icons/profile.svg"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    "Min 800",
                    style: apptheme.appfonttheme(
                        fontSize: 11,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromARGB(255, 126, 126, 126)),
                  ),
                ],
              )),
          Positioned(
              bottom: 10,
              left: 50,
              child: Text(
                "Starts at ₹777",
                style: apptheme.appfonttheme(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: apptheme.splashscreenbg),
              ))
        ],
      ),
    );
  }
}
