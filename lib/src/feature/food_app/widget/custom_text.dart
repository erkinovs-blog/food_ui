import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';

class CustomText extends StatefulWidget {
  final String text1;
  final String text2;
  final CrossAxisAlignment crossAxisAlignment;

  const CustomText({
    required this.text1,
    required this.text2,
    this.crossAxisAlignment = CrossAxisAlignment.start,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  late CrossAxisAlignment crossAxisAlignment;

  @override
  void initState() {
    crossAxisAlignment = widget.crossAxisAlignment;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: widget.crossAxisAlignment,
      children: [
        Text(
          widget.text1,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColor.mainColor,
            fontFamily: "Signika",
            fontSize: 25,
          ),
        ),
        Text(
          widget.text2,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            color: AppColor.grey,
            fontSize: 18,
          ),
        ),
      ],
    );
  }
}
