import 'package:flutter/material.dart';

class AppBarView extends StatelessWidget {
  final String title;
  final bool childPage;

  const AppBarView({
    Key? key,
    required this.title,
    this.childPage = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (childPage)
      return Text(title);
    else
      return Row(
        children: [
          Image.asset(
            "assets/logo_small.png",
            width: 24,
            height: 24,
          ),
          SizedBox(width: 4),
          Text(title),
        ],
      );
  }
}
