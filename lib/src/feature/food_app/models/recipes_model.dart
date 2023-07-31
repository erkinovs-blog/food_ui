import 'package:food_ui/src/feature/food_app/models/product_model.dart';

class RecipesModel extends Product {
  final int kcal;
  final String subtitle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      super == other &&
          other is RecipesModel &&
          runtimeType == other.runtimeType &&
          kcal == other.kcal &&
          subtitle == other.subtitle &&
          other.image == image &&
          other.isFavourite.value == isFavourite.value &&
          name == other.name;

  @override
  int get hashCode =>
      super.hashCode ^
      kcal.hashCode ^
      subtitle.hashCode ^
      isFavourite.value.hashCode ^
      name.hashCode ^
      image.hashCode;

  RecipesModel({
    required this.subtitle,
    required this.kcal,
    required super.name,
    required super.image,
  });
}
