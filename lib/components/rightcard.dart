import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/apptheme.dart';

class RightCard extends ConsumerWidget {
  RightCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);

  final String imageUrl;
  final apptheme = AppTheme();
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: const Color.fromARGB(255, 247, 229, 183)
                          .withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 5,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
              ),
              Positioned.fill(
                child: SvgPicture.asset(
                  imageUrl,
                  // Other image properties you may need
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 13, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: apptheme.appfonttheme(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: apptheme.splashscreenbg,
                  ),
                ),
                SizedBox(
                  width: 260,
                  child: Text(
                    subtitle,
                    style: apptheme.appfonttheme(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                    softWrap: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
