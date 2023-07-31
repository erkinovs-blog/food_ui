import 'package:flutter/material.dart';

import '../../../common/constants/app_icons.dart';
import '../widget/custom_bottom_camera.dart';
import '../widget/custom_bottom_images.dart';
import 'camera_page.dart';
import 'home_page.dart';
import 'like_page/likes_page.dart';
import 'profile_page.dart';
import 'search_page/search_page.dart';

class CustomPageController extends StatefulWidget {
  const CustomPageController({Key? key}) : super(key: key);

  @override
  State<CustomPageController> createState() => _CustomPageControllerState();
}

class _CustomPageControllerState extends State<CustomPageController> {
  int pageNumber = 0;

  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void pageChange(int value) {
    controller.jumpToPage(value);
    setState(() {
      pageNumber = value;
    });
  }

  void openCamera() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CameraPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        onPageChanged: pageChange,
        children: const [
          HomePage(),
          SearchPage(),
          CameraPage(),
          LikesPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: pageChange,
        currentIndex: pageNumber,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          const BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icHome),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icHomeBold),
          ),
          const BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icSearch),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icSearchBold),
          ),
          BottomNavigationBarItem(
            icon: CustomButtonCamera(image: AppIcons.icScan, onTap: openCamera),
            label: "",
            activeIcon: CustomButtonCamera(
              image: AppIcons.icCamera,
              onTap: openCamera,
            ),
          ),
          const BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icFavorite),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icFavoriteBold),
          ),
          const BottomNavigationBarItem(
            icon: CustomButtonImages(image: AppIcons.icProfile),
            label: "",
            activeIcon: CustomButtonImages(image: AppIcons.icProfile),
          ),
        ],
      ),
    );
  }
}
