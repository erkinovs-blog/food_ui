import 'package:food_ui/src/common/constants/app_foods_items.dart';
import 'package:food_ui/src/common/constants/app_recipes.dart';

import '../../feature/food_app/models/product_model.dart';

abstract class AppAllProducts {
  static List<Product> products = [
    ...AppFoods.foods,
    ...AppRecipes.recipes,
  ];
}
