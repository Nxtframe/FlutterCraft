import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget {
  CustomSearchBar({Key? key, required this.hintext}) : super(key: key);

  String hintext;
  final apptheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.8),
            offset: const Offset(1, 1),
            blurRadius: 5,
            spreadRadius: 0,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintext,
                  hintStyle: apptheme.appfonttheme(
                      fontSize: 14, fontWeight: FontWeight.w400)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Perform search action here
            },
          ),
        ],
      ),
    );
  }
}
