import 'package:flutter/material.dart';
import 'package:food_ui/src/feature/food_app/screens/page_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../common/constants/app_color.dart';
import 'intro_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  Widget checkLogin() {
    return FutureBuilder<SharedPreferences>(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SharedPreferences database = snapshot.data!;
          bool newUser = database.getBool("isLogged") ?? true;
          if (newUser) {
            return const IntroPage();
          } else {
            return  const CustomPageController();
          }
        } else if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }


  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => checkLogin(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Center(
                child: Text(
                  "kcal",
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 60,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                "ZUAMICA",
                style: TextStyle(
                  color: AppColor.splashPageText,
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
