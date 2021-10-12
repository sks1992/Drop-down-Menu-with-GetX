import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class ListTileDrawer extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? iconTrailing;
  final IconData? iconLeading;
  final Color tileColor;

  ListTileDrawer({
    required this.text,
    required this.onTap,
    this.iconTrailing,
    this.iconLeading,
    this.tileColor = colorWhite,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: tileColor,
      title: Text(text, style: TextStyle(color: Colors.black54),),
      onTap: onTap,
      trailing: Icon(
        iconTrailing,
      ),
      leading: Icon(
        iconLeading,
      ),
    );
  }
}
