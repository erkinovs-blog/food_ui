import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_pictures.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';
import '../widget/ads_carousel.dart';
import '../widget/custom_ads.dart';
import '../widget/custom_favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CustomAds> ads = [
    const CustomAds(),
    const CustomAds(),
    const CustomAds(),
  ];

  List<CustomFavorites> favoritesItems = [
    const CustomFavorites(
      text: "Fruits",
      image: AppPictures.imgStrawberry,
      textColor: AppColor.cardTextColor,
      bkgColor: AppColor.bkgFruitOne,
    ),
    const CustomFavorites(
      text: "Vegetables",
      image: AppPictures.imgVegetable,
      textColor: AppColor.vegetableText,
      bkgColor: AppColor.bkfFruitTwo,
    ),
    const CustomFavorites(
      text: "Snacks",
      image: AppPictures.snacks,
      textColor: AppColor.cardTextColor,
      bkgColor: AppColor.bkgFruitOne,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                Center(
                  child: FutureBuilder(
                    future: SharedPreferences.getInstance(),
                    builder: (context, snapshot) {
                      if(snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        throw "Error";
                      } else {
                        SharedPreferences db = snapshot.data!;
                        String name = db.getString("name") ?? "";
                        return RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                              color: AppColor.mainColor,
                            ),
                            children: [
                              TextSpan(text: "Hello $name,\n"),
                              const TextSpan(
                                text: "Find, track and eat heathy food.",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.textFieldHintColor,
                                ),
                              ),
                            ],
                          ),
                        );
                      }

                    }
                  ),
                ),
                const SizedBox(height: 30),
                AdsCarousel(
                  ads: ads,
                ),
                const SizedBox(height: 20),
                Center(
                  child: SizedBox(
                    width: 320,
                    height: 88,
                    child: DecoratedBox(
                      decoration: const BoxDecoration(
                        color: AppColor.stackColor,
                        borderRadius: BorderRadius.all(Radius.circular(24)),
                      ),
                      child: Stack(
                        children: [
                          const Image(
                            image: AssetImage(AppPictures.imgSubtract),
                            width: 232,
                            height: 88,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Center(
                                child: Text(
                                  "Track Your\nWeekly Progress",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: AppColor.white,
                                  ),
                                ),
                              ),
                              FilledButton(
                                style: FilledButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  fixedSize: const Size(104, 32),
                                  backgroundColor: AppColor.white,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(8),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: const Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      "View Now",
                                      style: TextStyle(
                                          color: AppColor.stackColor),
                                    ),
                                    Image(
                                      height: 12,
                                      width: 12,
                                      color: AppColor.stackColor,
                                      image: AssetImage(AppIcons.icPlay),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Your Favorites",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          favoritesItems.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: favoritesItems[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Choose Your Favorites",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 22,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                          favoritesItems.length,
                          (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: favoritesItems[index],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
