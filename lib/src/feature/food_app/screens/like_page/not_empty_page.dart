import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_color.dart';
import 'package:food_ui/src/common/constants/app_pictures.dart';
import 'package:food_ui/src/feature/food_app/models/favourite_food.dart';

import '../../widget/custom_like_food_card.dart';

class FavoritFoodPage extends StatefulWidget {

  const FavoritFoodPage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritFoodPage> createState() => _FavoritFoodPage();
}

class _FavoritFoodPage extends State<FavoritFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ValueListenableBuilder(
        valueListenable: favouriteFoods.foods,
        builder: (context, value, child) {
          return Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(
              value.length + 1,
              (index) {
                if (index == value.length) {
                  return const LikeFoodCard(image: AppPictures.imgPlus);
                }
                return LikeFoodCard(image: value[index].image);
              },
            ),
          );
        },
      ),
    );
  }
}
