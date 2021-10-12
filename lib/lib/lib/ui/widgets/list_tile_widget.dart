import 'package:eskool/core/models/list_tile_model.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';
import 'divider_line.dart';

class ListTileWidget extends StatelessWidget {
  final ListTileModel model;

  ListTileWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      model.subTitle.isNotEmpty
          ? ListTile(
              dense: true,
              title: _text(model.key),
              subtitle: _text(
                "(${model.subTitle})",
                fontSize: 11.0,
              ),
              trailing: _text(model.value),
            )
          : ListTile(
              dense: true,
              title: _text(model.key),
              trailing: _text(model.value),
            ),
      DividerLine(dividerColor: dividerColor),
    ]);
  }

  Widget _text(String text, {double? fontSize}) {
    return Text(
      text,
      style: TextStyle(
          color: Colors.black54, fontSize: fontSize ?? model.titleFontSize),
    );
  }
}
