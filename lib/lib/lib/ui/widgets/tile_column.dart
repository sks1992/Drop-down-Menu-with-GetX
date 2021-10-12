import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'title.dart';
import 'description.dart';

class TileColumn extends StatelessWidget {
  final String label;
  final String value;
  final CrossAxisAlignment crossAxisAlignment;
  final double valueFontSize;
  final double width;

  TileColumn({
    required this.label,
    required this.value,
    required this.width,
    this.valueFontSize = 12,
    this.crossAxisAlignment = CrossAxisAlignment.center,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: crossAxisAlignment,
        children: <Widget>[
          DescriptionText(
            label,
            fontSize: 11,
          ),
          TitleText(
            value,
            fontSize: valueFontSize,
          ),
        ],
      ),
    );
  }
}
