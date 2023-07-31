import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';


class InfoTexts extends StatelessWidget {
  final String mainText;
  final String text;

  const InfoTexts({
    required this.mainText,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          mainText,
          style: const TextStyle(
            fontSize: 16,
            color: AppColor.activeDotColor,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            fontSize: 24,
            color: AppColor.activeDotColor,
          ),
        ),
      ],
    );
  }
}
