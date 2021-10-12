import 'package:flutter/material.dart';

import '../../colors.dart';

class ThemeButtonSmall extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const ThemeButtonSmall({Key? key, required this.text, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text, style: TextStyle(fontSize: 12),),
      style: TextButton.styleFrom(
          backgroundColor: colorPurple.withOpacity(0.1)),
    );
  }
}
