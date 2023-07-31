import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';
import '../models/recipes_model.dart';

class RecipesCard extends StatefulWidget {
  final RecipesModel recipesModel;
  final ValueNotifier<List<RecipesModel>> recipeList;

  const RecipesCard(
      {required this.recipesModel,
      super.key,
      required,
      required this.recipeList});

  @override
  State<RecipesCard> createState() => _RecipesCardState();
}

class _RecipesCardState extends State<RecipesCard> {

  void onPressed() {
      widget.recipesModel.isFavourite.value = false;
      List<RecipesModel> temp = widget.recipeList.value;
      temp.remove(widget.recipesModel);
      widget.recipeList.value = temp.toList();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: 345,
      child: Card(
        color: const Color(0xFFEFF7EE),
        child: Row(
          children: [
            Expanded(
                child: Center(
              child: Image(
                image: AssetImage(widget.recipesModel.image),
                height: 75,
                width: 75,
              ),
            )),
            Expanded(
              flex: 2,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      splashRadius: 15,
                      padding: const EdgeInsets.all(0),
                      onPressed: onPressed,
                      icon: const Image(
                        image: AssetImage(AppIcons.isFevarite),
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.recipesModel.kcal} Kcal",
                        style: const TextStyle(
                          color: AppColor.mainColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.recipesModel.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.recipesModel.subtitle,
                        style: const TextStyle(
                          color: AppColor.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
