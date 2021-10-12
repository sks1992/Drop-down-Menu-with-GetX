import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FlatBorderButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPress;
  final Color textColor;

  FlatBorderButton({required this.label, required this.onPress, this.textColor = Colors.black54});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      child: Text(
        label,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: TextStyle(color: textColor, fontSize: 12,),
      ),
    );
  }
}
