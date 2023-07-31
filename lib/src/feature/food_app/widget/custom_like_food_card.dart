import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';

class LikeFoodCard extends StatelessWidget {
  const LikeFoodCard({
    super.key,
    required this.image,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 96,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColor.foodColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Center(
          child: Image(
            image: AssetImage(image),
            height: 64,
            width: 64,
          ),
        ),
      ),
    );
  }
}
