import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_color.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "kcal",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: AppColor.mainColor,
          fontSize: 35,
        ),
      ),
    );
  }
}
