import 'package:eskool/colors.dart';
import 'package:flutter/material.dart';

class ListExpandedTileView extends StatelessWidget {
  final IconData iconLeading;
  final String title;
  final Column expansionListTile;

  ListExpandedTileView(
      {required this.iconLeading,
      required this.title,
      required this.expansionListTile});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      collapsedBackgroundColor: colorWhite,
      iconColor: Colors.black54,
      leading: Icon(iconLeading,),
      title: Text(
        title,
        style: TextStyle(color: Colors.black54),
      ),
      children: [
        expansionListTile,
      ],
    );
  }
}
