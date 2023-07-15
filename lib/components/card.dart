import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final String imageUrl;
  final String text;
  final apptheme = AppTheme();

  CustomCard({super.key, required this.imageUrl, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.6),
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
            height: 100, // Adjust the height as desired
          ),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Text(text,
                style: apptheme.appfonttheme(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                )),
          ),
        ),
      ]),
    );
  }
}
