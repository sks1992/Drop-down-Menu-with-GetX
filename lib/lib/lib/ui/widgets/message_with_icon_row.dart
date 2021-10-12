import 'package:flutter/material.dart';

class MessageIconRow extends StatelessWidget {
  final String message;
  final IconData icon;

  const MessageIconRow(this.message, this.icon);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Text(
            message,
            style: TextStyle(color: Colors.white,fontSize: 22.0),
          ),
        ),
        Icon(
          icon,
          color: Colors.white,
        ),

      ],
    );
  }
}