import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../common/constants/app_color.dart';
import 'custom_ads.dart';

class AdsCarousel extends StatefulWidget {
  final List<CustomAds> ads;
  const AdsCarousel({
    required this.ads,
    super.key,
});

  @override
  State<AdsCarousel> createState() => _AdsCarouselState();
}

class _AdsCarouselState extends State<AdsCarousel> {
  int activeIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.ads.length,
          itemBuilder: (context, index, realIndex) {
            final ad = widget.ads[index];
            return buildCard(ad, index);
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) => setState(
              () => activeIndex = index,
            ),
            viewportFraction: 1,
            height: 169,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
          ),
        ),
        const SizedBox(height: 10),
        buildIndicator(),
      ],
    );
  }

  Widget buildCard(Widget card, int index) {
    return Container(
      child: card,
    );
  }
  Widget buildIndicator() => AnimatedSmoothIndicator(
    activeIndex: activeIndex,
    count: widget.ads.length,
    effect:   const ExpandingDotsEffect(
      dotWidth: 10,
      dotHeight: 8,
      activeDotColor: AppColor.activeDotColor,
      dotColor: AppColor.dotColor,
    ),
  );
}
