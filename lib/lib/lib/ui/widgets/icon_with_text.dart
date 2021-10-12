import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  final Icon icon;
  final String text;

  IconWithText({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          WidgetSpan(child: icon),
          TextSpan(
            text: "  $text",
            style:const TextStyle(color: Colors.grey,fontSize: 12),
          ),
        ],
      ),
    );
  }
}
