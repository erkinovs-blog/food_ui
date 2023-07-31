import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_pictures.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';
class CustomAds extends StatelessWidget {
  const CustomAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 169,
      width: 320,
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        color: AppColor.foodColor,
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "ARTICLE",
                      style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 10,
                        color: AppColor.activeDotColor,
                      ),
                    ),
                    const SizedBox(
                      width: 125,
                      height: 48,
                      child: Text(
                        "The pros and cons of fast food.",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: AppColor.cardTextColor,
                        ),
                      ),
                    ),
                    FilledButton(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(0),
                        fixedSize: const Size(104, 32),
                        backgroundColor: AppColor.activeDotColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text("Read Now"),
                          Image(
                            color: AppColor.white,
                            height: 12,
                            width: 12,
                            image: AssetImage(AppIcons.icPlay),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: Image(
                width: 111,
                height: 120,
                image: AssetImage(
                  AppPictures.imgBurgerGroup,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
