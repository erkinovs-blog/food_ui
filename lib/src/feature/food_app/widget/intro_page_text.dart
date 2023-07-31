import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';

class IntroPageText extends StatelessWidget {
  final String mainText;
  final String text;

  const IntroPageText({
    required this.mainText,
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          mainText,
          style: const TextStyle(
            color: AppColor.black,
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.black45,
            fontSize: 17,
          ),
        ),
      ],
    );
  }
}
