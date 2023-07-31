import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_pictures.dart';

import '../../widget/custom_button.dart';

class RecipesEmptyPage extends StatelessWidget {
  const RecipesEmptyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .1,
          ),
          const Center(
            child: Image(
              image: AssetImage(AppPictures.imgrecipesimage),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .16,
          ),
          CustomButton(
            text: "Search Recipes",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
