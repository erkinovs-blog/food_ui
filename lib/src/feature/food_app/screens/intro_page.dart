import 'package:flutter/material.dart';
import 'package:food_ui/src/feature/food_app/widget/custom_richtext.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_pictures.dart';

import '../widget/custom_button.dart';
import '../widget/custom_carousel.dart';
import '../widget/intro_page_text.dart';
import '../widget/logo_widget.dart';

import 'login_page.dart';
import 'registration_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  //TODO: Samandar:. IntroPage => Zafarbek:. Login or RegistrationPage;
  List<String> urlImages = [
    AppPictures.imgPage1,
    AppPictures.imgPage2,
    AppPictures.imgPage3,
  ];

  List<IntroPageText> customTexts = [
    const IntroPageText(
      mainText: "Eat Healthy",
      text: "Maintaining good health should be the primary focus of everyone.",
    ),
    const IntroPageText(
      mainText: "Healthy Recipes",
      text: "Browse thousands of healthy recipes from all over the world.",
    ),
    const IntroPageText(
      mainText: "Track Your Health",
      text: "With amazing inbuilt tools you can track your progress.",
    ),
  ];

  void openRegistrationPage() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) =>  const RegisterPage(),
    ),
  );

  void openLoginPage() => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LogoWidget(),
            CustomCarousel(
              customTexts: customTexts,
              urlImages: urlImages,
            ),
            CustomButton(
              text: "Get Started",
              onPressed: openRegistrationPage,
            ),
            CustomRichText(
              mainText: "Already Have An Acount? ",
              text: "Log In",
              onTap: openLoginPage,
              // onTap: openLoginPage,
            ),
          ],
        ),
      ),
    );
  }
}
