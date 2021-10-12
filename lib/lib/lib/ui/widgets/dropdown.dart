import 'package:eskool/core/models/drop_down_model.dart';
import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String value;
  final List<DropDownModel> items;
  final void Function(String) onChanged;

  DropDown({required this.value, required this.items, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: DropdownButton(
        underline: SizedBox(),
        isExpanded: true,
        value: this.value,
        items: this.items.map((DropDownModel t) {
          return DropdownMenuItem<String>(
            value: t.id.toString(),
            child: Text(t.name),
          );
        }).toList(),
        onChanged: (String? val) {
          onChanged(val ?? "");
        },
      ),
    );
  }
}
