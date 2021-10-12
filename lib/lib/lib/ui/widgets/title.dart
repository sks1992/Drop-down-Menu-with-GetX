import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  final String title;
  final double fontSize;
  final Color color;

  const TitleText(this.title,
      {this.fontSize = 20.0, this.color = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.w700,
        color: color,
      ),
    );
  }
}
