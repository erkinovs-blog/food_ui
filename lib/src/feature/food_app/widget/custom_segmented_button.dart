import 'package:flutter/material.dart';
import '../../../common/constants/app_color.dart';

class CustomSegmentedButton extends StatelessWidget {
  const CustomSegmentedButton({
    super.key,
    required this.pageController,
    required this.onFirstPressed,
    required this.onSecondPressed,
    required this.valueNotifier,
  });

  final PageController pageController;
  final ValueNotifier<bool> valueNotifier;
  final void Function() onFirstPressed;
  final void Function() onSecondPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: ValueListenableBuilder(
        valueListenable: valueNotifier,
        builder: (context, value, child) {
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onFirstPressed,
                  child:  SizedBox.expand(
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: value ? AppColor.bottoncolor_2 : AppColor.activeDotColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(16),
                          bottomLeft: Radius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Food",
                          style: TextStyle(fontSize: 16, color: value ? AppColor.activeDotColor : AppColor.white),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: onSecondPressed,
                  child: SizedBox.expand(
                    child: DecoratedBox(
                      decoration:  BoxDecoration(
                        color: value ? AppColor.activeDotColor : AppColor.bottoncolor_2,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Recipes",
                          style: TextStyle(
                            fontSize: 16,
                            color: value ? AppColor.white : AppColor.activeDotColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }
      ),
    );
  }
}
