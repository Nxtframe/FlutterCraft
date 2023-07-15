import 'package:craftui/constants/apptheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SimpleColumnImage extends ConsumerStatefulWidget {
  const SimpleColumnImage(
      {super.key, required this.imageUrl, required this.subtitle});
  final String imageUrl;
  final String subtitle;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SimpleColumnImageState();
}

class _SimpleColumnImageState extends ConsumerState<SimpleColumnImage> {
  final apptheme = AppTheme();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          height: 90,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(widget.imageUrl))),
          child: Image.asset(widget.imageUrl)),
      const SizedBox(height: 10),
      Text(
        widget.subtitle,
        style: apptheme.appfonttheme(fontSize: 12, fontWeight: FontWeight.w400),
      ),
      const SizedBox(
        width: 80,
      )
    ]);
  }
}
