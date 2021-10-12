import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:eskool/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class FormFieldText extends StatelessWidget {
  final int maxLines;
  final int maxLength;
  final TextInputType inputType;
  final String prefix;
  final List<TextInputFormatter>? inputFormatter;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final Function(String)? onSubmit;
  final bool obscureText;
  final bool enabled;

  FormFieldText({
    this.maxLines = 1,
    this.maxLength = 100,
    this.inputType = TextInputType.text,
    this.prefix = "",
    this.inputFormatter,
    required this.controller,
    this.focusNode,
    this.onSubmit,
    this.obscureText = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      obscureText: obscureText,
      autofocus: false,
      autocorrect: false,
      enableSuggestions: false,
      maxLines: maxLines,
      maxLength: maxLength > 0 ? maxLength : null,
      keyboardType: inputType,
      inputFormatters: inputFormatter,
      cursorColor: colorRed,
      controller: controller,
      focusNode: focusNode,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        isDense: true,
        prefix: Text(prefix),
        contentPadding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        enabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: primarySwatchColor.withOpacity(0.3)),
        ),
        disabledBorder: OutlineInputBorder(
          borderSide: new BorderSide(color: Colors.grey.withOpacity(0.3)),
        ),
        filled: !enabled,
        fillColor: dividerColor
      ),
    );
  }
}
