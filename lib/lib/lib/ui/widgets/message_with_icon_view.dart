import 'package:flutter/material.dart';

class MessageIcon extends StatelessWidget {
  final String message;
  final IconData icon;
  final Color iconColor;

  const MessageIcon(this.message, this.icon, [this.iconColor = Colors.black26]);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 56.0,
            color: iconColor,
          ),
          Text(
            message,
            style: TextStyle(color: Colors.black45),
          ),
        ],
      ),
    );
  }
}
