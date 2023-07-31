
import 'package:flutter/material.dart';

import '../widget/custom_login_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth <= 428 && constraints.maxHeight <= 960){
            return CustomLoginPage(constraints: constraints);
          }else {
            return const Scaffold(backgroundColor: Colors.red);
          }
        },
      ),
    );
  }
}
