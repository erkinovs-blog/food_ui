import 'package:flutter/material.dart';

mixin class CustomScaffoldMessenger {
  void showCustomSnack(BuildContext context,String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
}

