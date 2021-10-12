import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String description;
  final double fontSize;
  final Color textColor;

  const DescriptionText(this.description, {this.fontSize = 16.0, this.textColor = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: textColor,
      ),
    );
  }
}
