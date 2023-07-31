import 'package:flutter/material.dart';
import '../../feature/food_app/screens/splash_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Kcal App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Signika",
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}