import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

class AppbarCustom extends ConsumerWidget implements PreferredSizeWidget {
  const AppbarCustom({super.key, required this.title, required this.color});
  final String title;
  final int color;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      backgroundColor: Color(color),
      elevation: 0,
      title: Text(
        title,
        style: AppTheme().appfonttheme(color: Colors.black, fontSize: 16),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Container(
          alignment: Alignment.center,
          height: 14,
          width: 7,
          child: SvgPicture.asset(
            "assets/icons/back-arrow.svg",
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
