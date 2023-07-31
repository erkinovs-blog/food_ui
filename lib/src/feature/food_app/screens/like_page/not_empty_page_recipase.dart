import 'package:flutter/material.dart';
import 'package:food_ui/src/feature/food_app/models/favorite_resipe.dart';

import '../../../../common/constants/app_color.dart';
import '../../widget/custom_recisep.dart';

class NotEmptyRecipasePage extends StatefulWidget {

  const NotEmptyRecipasePage({
    Key? key,
  }) : super(key: key);

  @override
  State<NotEmptyRecipasePage> createState() => _NotEmptyRecipasePage();
}

class _NotEmptyRecipasePage extends State<NotEmptyRecipasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: ValueListenableBuilder(
        valueListenable: resipeFood.resipe,
        builder: (context,value,child) {
          return Wrap(
            children: value.map((e) => RecipesCard(recipesModel: e, recipeList: resipeFood.resipe)).toList(),
          );
        }
      ),
    );
  }
}
