import 'package:flutter/material.dart';

class Ingredients extends StatelessWidget {
  final String images;
  final double? size;

  const Ingredients({
    required this.images,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 64,
      height: size ?? 64,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
          color: Color(0xFFFFF8EE),
        ),
        child: IconButton(
          onPressed: (){},
          icon: Image(image: AssetImage(images),width: 40,height: 40,),
        ),
      ),
    );
  }
}
