import 'package:food_ui/src/common/constants/app_pictures.dart';

import '../../feature/food_app/models/recipes_model.dart';

abstract class AppRecipes {
  static List<RecipesModel> recipes = [
    RecipesModel(subtitle: "Scallions & tomatoes", kcal: 250, name: "Chopped Spring Ramen", image: AppPictures.imgSalad),
    RecipesModel(subtitle: "Chicken & Salad", kcal: 450, name: "Chicken Tandoori", image: AppPictures.imgChicken),
  ];
}