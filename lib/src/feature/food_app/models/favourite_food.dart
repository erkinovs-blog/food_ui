import 'package:flutter/cupertino.dart';
import 'food_model.dart';

FavouriteFood favouriteFoods = FavouriteFood();

class FavouriteFood {
  ValueNotifier<List<FoodModel>> foods = ValueNotifier([]);
}