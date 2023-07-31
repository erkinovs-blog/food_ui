import 'package:flutter/material.dart';
import 'package:food_ui/src/common/constants/app_color.dart';
import 'package:food_ui/src/common/constants/app_icons.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../../../common/constants/app_links.dart';
import '../../../../common/constants/app_pictures.dart';
import '../../models/search_page_card_model.dart';
import '../../widget/custom_search_card.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final List<SearchPageCardModel> searchPageCards = [
    SearchPageCardModel(
        title: "The Pumpkin Secrets",
        subtitle: "The Pumpkin Secrets",
        imagePath: AppPictures.imgPumpkin),
    SearchPageCardModel(
        title: "The Green Secrets",
        subtitle: "The Green Secrets",
        imagePath: AppPictures.imgGreenSalad),
    SearchPageCardModel(
        title: "The Pumpkin Secrets",
        subtitle: "The Pumpkin Secrets",
        imagePath: AppPictures.imgPumpkin),
    SearchPageCardModel(
        title: "The Pumpkin Secrets",
        subtitle: "The Pumpkin Secrets",
        imagePath: AppPictures.imgPumpkin),
    SearchPageCardModel(
        title: "The Pumpkin Secrets",
        subtitle: "The Pumpkin Secrets",
        imagePath: AppPictures.imgPumpkin),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Expanded(
      flex: 10,
      child: Column(
        children: [
          buildTitleText("Hot Now"),
          Expanded(
            flex: 1,
            child: FractionallySizedBox(
              heightFactor: 1,
              child: ListView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: searchPageCards
                    .map(
                      (e) => SearchPageCard(
                        width: size.width * 0.5,
                        title: e.title,
                        subtitle: e.subtitle,
                        imagePath: e.imagePath,
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          const SizedBox(height: 24),
          buildTitleText("Trending"),
          Expanded(
            flex: 1,
            child: SizedBox.expand(
              child: ListView.separated(
                itemCount: AppLinks.links.length,
                itemBuilder: (context, index) {
                  return buildLink(AppLinks.links[index]);
                },
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 20,
                    color: AppColor.dividerColor,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildLink(String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () async {
            const url = "https://youtu.be/dQw4w9WgXcQ";
            if(await canLaunchUrlString(url)) {
              await launchUrlString(url);
            }
          },
          child: Text(
            text,
            style: const TextStyle(
              color: AppColor.activeDotColor,
              fontWeight: FontWeight.w400,
              letterSpacing: -0.24,
              fontSize: 16,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        const Image(
          image: AssetImage(AppIcons.icCurve),
          height: 8,
          width: 15,
          fit: BoxFit.cover,
        ),
      ],
    );
  }

  Padding buildTitleText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 22, fontWeight: FontWeight.w400, letterSpacing: -0.24),
        ),
      ),
    );
  }
}
