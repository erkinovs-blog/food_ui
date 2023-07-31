import 'package:flutter/material.dart';
import 'package:food_ui/src/feature/food_app/widget/custom_scaffold_messenger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/constants/app_color.dart';
import '../screens/login_page.dart';
import '../screens/page_controller.dart';
import 'custom_button.dart';
import 'custom_richtext.dart';
import 'custom_text.dart';
import 'custom_text_form_fild.dart';
import 'logo_widget.dart';
import 'regiter_page_bottons.dart';

class CustomCreatePage extends StatefulWidget {
  final BoxConstraints constraints;

  const CustomCreatePage({
    Key? key,
    required this.constraints,
  }) : super(key: key);

  @override
  State<CustomCreatePage> createState() => _CustomCreatePageState();
}

class _CustomCreatePageState extends State<CustomCreatePage>
    with CustomScaffoldMessenger {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  String? validateName(String? value) {
    if (value != null && value.length <= 2) {
      return "Invalid name";
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

  void openLoginPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  void onPressed() async {
    if (formKey.currentState!.validate()) {
      SharedPreferences db = await SharedPreferences.getInstance();
      List<String> userName = db.getStringList(emailController.text) ?? [];
      if (userName.isEmpty && mounted) {
        String name = nameController.text;
        String email = emailController.text;
        String password = passwordController.text;
        db.setStringList(email, [password, name]);
        db.setBool("isLogged", false);
        db.setString("name", name);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const CustomPageController(),
          ),
              (route) => false,
        );
      } else if (mounted) {
        showCustomSnack(
            context, "Bunday foydalanuvchi bor iltimos tizimga kiring...");
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: SizedBox(
        height: widget.constraints.maxHeight,
        width: widget.constraints.maxWidth,
        child: Column(
          children: [
            SizedBox(height: widget.constraints.maxHeight * .07),
            const LogoWidget(),
            SizedBox(height: widget.constraints.maxHeight * .01),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomText(text1: "Sign Up", text2: "Welcome to Kcal!"),
                  SizedBox(
                    height: widget.constraints.maxHeight * .04,
                  ),
                  CustomTextFormField(
                    controller: nameController,
                    validator: validateName,
                    hinText: "Full Name",
                    icon: Icons.person,
                  ),
                  SizedBox(height: widget.constraints.maxHeight * 0.02),
                  CustomTextFormField(
                    controller: emailController,
                    validator: validateEmail,
                    hinText: "Email address",
                    icon: Icons.email,
                  ),
                  SizedBox(height: widget.constraints.maxHeight * 0.02),
                  CustomTextFormField(
                    controller: passwordController,
                    validator: validatePassword,
                    hinText: "Password",
                    icon: Icons.lock,
                    res: true,
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 6,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  flex: 3,
                  child: Divider(
                    color: AppColor.grey,
                    height: 1,
                    indent: 20,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: AppColor.grey,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Divider(
                    height: 1,
                    endIndent: 20,
                    color: AppColor.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: widget.constraints.maxHeight * .025),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRegisterButton(
                  constraints: widget.constraints,
                  iconPath: "assets/images/picture/apple.png",
                ),
                SizedBox(width: MediaQuery.of(context).size.width * .04),
                CustomRegisterButton(
                  constraints: widget.constraints,
                  iconPath: "assets/images/picture/email.png",
                ),
              ],
            ),
            SizedBox(height: widget.constraints.maxHeight * .025),
            CustomButton(
              text: "Sign Up",
              onPressed: onPressed,
            ),
            SizedBox(height: widget.constraints.maxHeight * .025),
            CustomRichText(
              onTap: openLoginPage,
              text: "Log In",
              mainText: "Already Have An Acount? ",
            ),
            SizedBox(height: widget.constraints.maxHeight * .025),
          ],
        ),
      ),
    );
  }
}
