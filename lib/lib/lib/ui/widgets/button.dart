import 'package:dio/dio.dart';
import 'package:eskool/colors.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;

  Button(this.text, this.onPressed, {this.backgroundColor = colorPurple});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      width: 200,
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(fontSize: 16.0),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
