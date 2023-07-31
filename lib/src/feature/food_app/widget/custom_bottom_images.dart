import 'package:flutter/material.dart';

class CustomButtonImages extends StatelessWidget {
  final String image;

  const CustomButtonImages({
    required this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 36,
      height: 36,
      child: Image(
        image: AssetImage(image),
      ),
    );
  }
}
