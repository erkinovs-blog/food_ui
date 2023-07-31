import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';

class CustomRegisterButton extends StatelessWidget {
  final String iconPath;
  final BoxConstraints constraints;

  const CustomRegisterButton({
    Key? key,
    required this.constraints,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Image(
        image: AssetImage(iconPath),
        width: 24,
        height: 24,
        color: AppColor.white,
      ),
      style: IconButton.styleFrom(
        backgroundColor: AppColor.grey,
        fixedSize:
            Size(constraints.maxHeight * .07, constraints.maxHeight * .07),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
      ),
    );
  }
}
