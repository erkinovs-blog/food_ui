import 'package:flutter/material.dart';
import 'package:food_ui/src/feature/food_app/widget/custom_text_field.dart';

import '../../../common/constants/app_color.dart';
import '../models/product_model.dart';

class LikeSearchPage extends StatefulWidget {
  const LikeSearchPage({super.key, required this.products});

  final ValueNotifier<List<Product>> products;

  @override
  State<LikeSearchPage> createState() => _LikeSearchPageState();
}

class _LikeSearchPageState extends State<LikeSearchPage> {
  late TextEditingController searchController;
  late ValueNotifier<List<Product>> products;

  @override
  void initState() {
    super.initState();
    searchController = TextEditingController();
    products = widget.products;
  }

  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        centerTitle: true,
        title: const Text(
          "Search",
          style: TextStyle(
            color: AppColor.searchPageTitleColor,
            letterSpacing: 0.6,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        children: [
          CustomTextField(
            controller: searchController,
            onTap: () {},
            onChanged: (value) {

            },
            isFavouriteTextField: true,
          )
        ],
      ),
    );
  }
}
