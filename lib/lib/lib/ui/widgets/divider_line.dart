import 'package:flutter/material.dart';

class DividerLine extends StatelessWidget {
  final Color dividerColor;

  DividerLine({required this.dividerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: dividerColor,
            width: DividerTheme.of(context).thickness ?? 0.0,
          ),
        ),
      ),
    );
  }
}
