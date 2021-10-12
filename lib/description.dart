import 'package:flutter/material.dart';

class DescriptionText extends StatelessWidget {
  final String description;
  final double fontSize;

  const DescriptionText(this.description, {this.fontSize = 16.0, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: Colors.black54,
        fontFamily: "Inconsolata",
      ),
    );
  }
}

class DescriptionTextVrl extends StatelessWidget {
  final String description;
  final double fontSize;

  const DescriptionTextVrl(this.description, {this.fontSize = 12.0,Key? key})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(
      description,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
        color: Colors.black54,
      ),
    );
  }
}
