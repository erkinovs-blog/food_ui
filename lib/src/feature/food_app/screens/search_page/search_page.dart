import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_all_products.dart';
import 'package:food_ui/src/feature/food_app/screens/search_page/first_page.dart';
import 'package:food_ui/src/feature/food_app/screens/search_page/second_page.dart';
import 'package:food_ui/src/feature/food_app/widget/custom_text_field.dart';

import '../../../../common/constants/app_color.dart';
import '../../models/product_model.dart';

class SearchPage extends StatefulWidget {

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _controller;
  ValueNotifier<bool> isTappedNotifier = ValueNotifier(false);
  ValueNotifier<List<Product>> suggestions = ValueNotifier(AppAllProducts.products);

  void onChanged(String value) {
    List<Product> matchQuery = [];
    for (Product food in AppAllProducts.products) {
      if (food.name.toLowerCase().startsWith(value.trim().toLowerCase())) {
        matchQuery.add(food);
      }
    }
    suggestions.value = matchQuery;
  }

  void onTap() {
    isTappedNotifier.value = true;
  }

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: isTappedNotifier,
      builder: (context, isTapped, child) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: isTapped
                ? AppBar(
                    leading: BackButton(
                      onPressed: () {
                        isTappedNotifier.value = false;
                        _controller.clear();
                      },
                    ),
                    centerTitle: true,
                    title: const Text(
                      "Search",
                      style: TextStyle(
                        color: AppColor.searchPageTitleColor,
                        letterSpacing: 0.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : null,
            body: Padding(
              padding: const EdgeInsets.only(right: 24, left: 24, top: 24),
              child: Column(
                children: [
                  CustomTextField(
                    controller: _controller,
                    onTap: onTap,
                    onChanged: onChanged,
                  ),
                  isTapped
                      ? SecondPage(
                          controller: _controller,
                          suggestions: suggestions,
                        )
                      : const FirstPage(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
