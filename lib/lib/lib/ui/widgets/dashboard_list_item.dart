import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'description.dart';
import 'theme_button_small.dart';

class DashboardListItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final String buttonText;
  final VoidCallback onButtonPressed;

  const DashboardListItem(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.buttonText,
      required this.onButtonPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DescriptionText(title, textColor: Colors.black, fontSize: 14),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                const SizedBox(height: 8),
                DescriptionText(
                  subTitle,
                  fontSize: 12,
                ),
              ],
            ),
            Column(
              children: [
                ThemeButtonSmall(
                  onPressed: onButtonPressed,
                  text: buttonText,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
