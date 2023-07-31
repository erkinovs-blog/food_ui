import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_pictures.dart';
import 'custom_button.dart';
import 'custom_richtext.dart';
import 'info_text.dart';
import 'ingredients.dart';

class CameraDialog extends StatefulWidget {
  final bool screenCamera;

  const CameraDialog({
    required this.screenCamera,
    super.key,
  });

  @override
  State<CameraDialog> createState() => _CameraDialogState();
}

class _CameraDialogState extends State<CameraDialog> {
  List<InfoTexts> infoTexts = [
    const InfoTexts(mainText: "Protein", text: "450g"),
    const InfoTexts(mainText: "Calories", text: "220g"),
    const InfoTexts(mainText: "Fat", text: "100g"),
    const InfoTexts(mainText: "Carbs", text: "49g"),
  ];

  List<Ingredients> ingredients = [
    const Ingredients(
      images: AppPictures.imgBread,
    ),
    const Ingredients(images: AppPictures.imgTomato),
    const Ingredients(images: AppPictures.imgSalad),
    const Ingredients(images: AppPictures.view),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 700,
      child: DecoratedBox(
        decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(width: double.infinity),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: CloseButton(),
            ),
            const Center(
              child: Image(
                width: 140,
                height: 140,
                image: AssetImage(AppPictures.imgBurger),
              ),
            ),
            SizedBox(
              height: 80,
              child: ColoredBox(
                color: const Color(0xFFFFF8EE),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                    infoTexts.length,
                    (index) => infoTexts[index],
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Details",
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: CustomRichText(
                mainText:
                    "A hamburger (also burger for short) is a sandwich consisting of one or more cooked patties of ground meat, usually beef, placed inside a sliced bread  ",
                text: "Read More...",
                onTap: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "Ingredients",
                style: TextStyle(
                  color: AppColor.black,
                  fontSize: 22,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                  ingredients.length, (index) => ingredients[index]),
            ),
            const SizedBox(height: 10),
            Center(
              child: CustomButton(
                text: "Add To Favorites",
                onPressed: () {

                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
