import 'package:flutter/material.dart';
import 'package:food_ui/src/feature/food_app/widget/custom_scaffold_messenger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/page_controller.dart';
import '../screens/registration_page.dart';
import 'custom_button.dart';
import 'custom_richtext.dart';
import 'custom_text.dart';
import 'custom_text_form_fild.dart';
import 'logo_widget.dart';

class CustomLoginPage extends StatefulWidget {
  final BoxConstraints constraints;

  const CustomLoginPage({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  State<CustomLoginPage> createState() => _CustomLoginPageState();
}

class _CustomLoginPageState extends State<CustomLoginPage>
    with CustomScaffoldMessenger {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void openHomePage() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences db = await SharedPreferences.getInstance();
      List<String> userData = db.getStringList(emailController.text) ?? [];
      if (userData.isEmpty && mounted) {
        showCustomSnack(context, "Ro'yhatdan o'tmagansiz!");
      } else {
        String password = userData.first;
        if (password == passwordController.text) {
          db.setBool("isLogged", false);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) =>  const CustomPageController(),
            ),
            (route) => false,
          );
        } else if (mounted) {
          showCustomSnack(context, "Email yoki parol xato. Qayta urining...");
        }
      }
    }
  }

  void openRegisterPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RegisterPage(),
      ),
    );
  }

  String? validatePassword(String? value) {
    if (value != null && !RegExp(r".{8,}").hasMatch(value)) {
      return "Password is too short, it must be at least 8 characters";
    }
    if (value != null && value.contains(" ")) {
      return "Password shouldn't have space";
    }
    if (value != null && !RegExp(r"\d").hasMatch(value)) {
      return "Password must have at least one number";
    }
    if (value != null && !RegExp(r"[a-z]").hasMatch(value)) {
      return "Password must have at least one letter";
    }
    if (value != null && !RegExp(r"[A-Z]").hasMatch(value)) {
      return "Password must have at least one Capital letter";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value != null &&
        !RegExp(r"^[a-zA-Z][a-zA-Z0-9]*@[a-zA-Z0-9]+\.[a-zA-Z]{2,6}$")
            .hasMatch(value)) {
      return "Invalid email address!";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        width: widget.constraints.maxWidth,
        height: widget.constraints.maxHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: widget.constraints.maxHeight * .07),
            const LogoWidget(),
            SizedBox(
              height: widget.constraints.maxHeight * .01,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text1: "Sign In", text2: "Welcome to back!"),
                  SizedBox(
                    height: widget.constraints.maxHeight * .05,
                  ),
                  CustomTextFormField(
                    validator: validateEmail,
                    hinText: "Email address",
                    icon: Icons.email,
                    controller: emailController,
                  ),
                  SizedBox(height: widget.constraints.maxHeight * 0.02),
                  CustomTextFormField(
                    validator: validatePassword,
                    hinText: "Password",
                    helperText: true,
                    icon: Icons.lock,
                    res: true,
                    controller: passwordController,
                  ),
                ],
              ),
            ),
            const Spacer(),
            Center(
              child: CustomButton(
                text: "Sign In",
                onPressed: openHomePage,
              ),
            ),
            SizedBox(
              height: widget.constraints.maxHeight * .014,
            ),
            Center(
              child: CustomRichText(
                onTap: openRegisterPage,
                text: "Register",
                mainText: "You don't have an account? ",
              ),
            ),
            SizedBox(
              height: widget.constraints.maxHeight * .03,
            ),
          ],
        ),
      ),
    );
  }
}
