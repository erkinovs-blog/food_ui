import 'package:flutter/widgets.dart';

class Product {
  final String name;
  final String image;
  final ValueNotifier<bool> isFavourite;

  Product({
    required this.name,
    required this.image,
  }) : isFavourite = ValueNotifier(false);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Product &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          image == other.image &&
          isFavourite.value == other.isFavourite.value);

  @override
  int get hashCode =>
      name.hashCode ^ image.hashCode ^ isFavourite.value.hashCode;

  @override
  String toString() {
    return 'Product{ name: $name, image: $image, isFavourite: $isFavourite,}';
  }
}
