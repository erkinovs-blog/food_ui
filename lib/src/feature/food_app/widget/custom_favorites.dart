import 'package:flutter/material.dart';

class CustomFavorites extends StatelessWidget {
  final Color bkgColor;
  final Color textColor;
  final String image;
  final String text;

  const CustomFavorites({
    required this.bkgColor,
    required this.textColor,
    required this.image,
    required this.text,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: SizedBox(
        height: 144,
        width: 132,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: bkgColor,
            borderRadius: const BorderRadius.all(Radius.circular(32)),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image(
                    width: 50,
                    height: 50,
                    image: AssetImage(image),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                      fontSize: 17,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
