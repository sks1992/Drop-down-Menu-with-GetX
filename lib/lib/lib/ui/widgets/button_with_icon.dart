import 'package:flutter/material.dart';

import '../../colors.dart';

class ButtonWithIcon extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final IconData icon;

  ButtonWithIcon(
      {required this.text, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      style:
          TextButton.styleFrom(backgroundColor: colorPurple.withOpacity(0.1)),
      onPressed: onPressed,
      icon: Icon(icon, color: colorPurple),
      label: Text(
        text,
        style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),
      ),
    );
  }
}
