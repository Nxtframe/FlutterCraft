import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/apptheme.dart';

class ServicesCard extends ConsumerWidget {
  ServicesCard({Key? key, required this.imageUrl}) : super(key: key);
  String imageUrl;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: 350,
        width: 370,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.withOpacity(0.5),
                width: 1,
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  left: 10,
                  top: 10,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: SizedBox(
                      height: 130,
                      width: 350,
                      child: Image.asset(
                        imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: AppTheme().splashscreenbg,
                    ),
                    child: Text(
                      'Recommended',
                      style: AppTheme().appfonttheme(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 15,
                  top: 160,
                  child: Row(
                    children: [
                      Image.asset("assets/Signature Badge 2.png"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Signature',
                        style: AppTheme().appfonttheme(
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                          color: AppTheme().splashscreenbg,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned.fill(
                    top: 200,
                    left: 20,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SvgPicture.asset("assets/sparkles.svg"),
                            const SizedBox(
                              width: 7,
                            ),
                            Text("High Quality Disposable Cutlery",
                                style: AppTheme().appfonttheme(
                                    fontSize: 14, fontWeight: FontWeight.w300))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/sparkles.svg"),
                            const SizedBox(
                              width: 7,
                            ),
                            Text("Elegant Decorations & Table Settings",
                                style: AppTheme().appfonttheme(
                                    fontSize: 14, fontWeight: FontWeight.w300))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/sparkles.svg"),
                            const SizedBox(
                              width: 7,
                            ),
                            Text("Served by Waitstaff",
                                style: AppTheme().appfonttheme(
                                    fontSize: 14, fontWeight: FontWeight.w300))
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/sparkles.svg"),
                            const SizedBox(
                              width: 7,
                            ),
                            Text(
                              "Best for Weddings, Corporate Events etc",
                              style: AppTheme().appfonttheme(
                                  fontSize: 14, fontWeight: FontWeight.w300),
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
