import 'package:flutter/material.dart';

import 'dropdown_model.dart';

class DropDown extends StatelessWidget {
  final String value;
  final List<DropDownModel> items;
  final void Function(String) onChanged;

  const DropDown(
      {required this.value,
      required this.items,
      required this.onChanged,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
      ),
      child: DropdownButton(
        underline: const SizedBox(),
        isExpanded: true,
        value: value,
        items: items.map((DropDownModel t) {
          return DropdownMenuItem<String>(
            value: t.id.toString(),
            child: Text(t.name),
          );
        }).toList(),
        onChanged: (String? val) {
          onChanged(val!);
        },
      ),
    );
  }
}
