import 'package:food_ui/src/common/constants/app_pictures.dart';
import '../../feature/food_app/models/food_model.dart';

abstract class AppFoods {
  static  List<FoodModel> foods = [
    FoodModel(name: "Gamburger", image: AppPictures.imgBurger),
    FoodModel(name: "Cake", image: AppPictures.imgIceCream),
    FoodModel(name: "Bread", image: AppPictures.imgBread),
    FoodModel(name: "Pizza", image: AppPictures.imgPizza),
    FoodModel(name: "Baked", image: AppPictures.imgBaked),
    FoodModel(name: "Hotdog", image: AppPictures.imgHodDog),
  ];
}
