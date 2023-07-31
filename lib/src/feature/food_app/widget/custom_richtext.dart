import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../common/constants/app_color.dart';

class CustomRichText extends StatelessWidget {
  final String mainText;
  final String text;
  final void Function()? onTap;

  const CustomRichText({
    required this.mainText,
    required this.text,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          color: AppColor.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: mainText),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = onTap,
            text: text,
            style: const TextStyle(color: AppColor.mainColor),
          ),
        ],
      ),
    );
  }
}
