import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_color.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const CustomButton({
    required this.text,
    required this.onPressed,
    super.key,
});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      style: FilledButton.styleFrom(
        fixedSize: const Size(290, 72),
        backgroundColor: AppColor.mainColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(24)),
        ),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
         text,
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
