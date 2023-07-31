//TODO: Zafarbek registration page => Qobil:. homepage;

import 'package:flutter/material.dart';

import '../widget/custom_create_account.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if(constraints.maxWidth <= 428 && constraints.maxHeight <= 960){
            return CustomCreatePage(constraints: constraints,);
          }else {
            return const Scaffold(backgroundColor: Colors.red);
          }
        },
      ),
    );
  }
}
