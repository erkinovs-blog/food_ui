import 'package:flutter/material.dart';

import '../../../../common/constants/app_icons.dart';
import '../../widget/custom_button.dart';

class FoodEmptyPage extends StatelessWidget {
  const FoodEmptyPage({Key? key}) : super(key: key);

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
              image: AssetImage(AppIcons.center),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .16,
          ),
          CustomButton(
            text: "Search Food",
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
