import 'package:flutter/material.dart';

class LabelText extends StatelessWidget {
  final String label;

  const LabelText(this.label);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          fontSize: 14, color: Colors.black54,),
    );
  }
}
