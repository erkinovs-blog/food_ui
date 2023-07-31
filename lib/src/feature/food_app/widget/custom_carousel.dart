import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/constants/app_color.dart';
import 'intro_page_text.dart';

class CustomCarousel extends StatefulWidget {
  final List<String> urlImages;
  final List<IntroPageText> customTexts;

  const CustomCarousel({
    required this.urlImages,
    required this.customTexts,
    super.key,
  });

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  ValueNotifier<int> activeIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = widget.urlImages[index];
            final customText = widget.customTexts[index];
            return Column(
              children: [
                buildImage(urlImage, index),
                buildText(customText, index)
              ],
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              activeIndex.value = index;
            },
            viewportFraction: 1,
            height: 390,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
          ),
        ),
        buildIndicator(),
      ],
    );
  }

  Widget buildImage(String urlImage, int index) {
    return Image.asset(
      height: 282,
      width: 282,
      urlImage,
      fit: BoxFit.cover,
    );
  }

  Widget buildText(Widget customTexts, int index) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 35),
      child: customTexts,
    );
  }

  Widget buildIndicator() => ValueListenableBuilder(
        valueListenable: activeIndex,
        builder: (context, value, _) {
          return AnimatedSmoothIndicator(
            activeIndex: value,
            count: widget.urlImages.length,
            effect: const ExpandingDotsEffect(
              dotWidth: 12,
              dotHeight: 10,
              activeDotColor: AppColor.activeDotColor,
              dotColor: AppColor.dotColor,
            ),
          );
        },
      );
}
