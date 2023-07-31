import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';

class CustomTextFormField extends StatefulWidget {
  final String hinText;
  final IconData icon;
  final String? Function(String? value) validator;
  final bool res;
  final bool helperText;
  final TextEditingController controller;

  const CustomTextFormField({
    Key? key,
    required this.hinText,
    required this.icon,
    required this.validator,
    this.res = false,
    this.helperText = false,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool res;
  late bool helperText;
  ValueNotifier<bool> isObscure = ValueNotifier<bool>(false);

  @override
  void initState() {
    res = widget.res;
    helperText = widget.helperText;
    super.initState();
  }

  void onTap() {
    isObscure.value = !isObscure.value;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isObscure,
        builder: (context, value, _) {
          return TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: value,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: AppColor.mainColor, width: 1.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              helperStyle: const TextStyle(
                fontSize: 16,
                color: AppColor.activeDotColor,
              ),
              prefixIcon: Icon(widget.icon),
              hintText: widget.hinText,
              counter: res
                  ? InkWell(
                      onTap: onTap,
                      child: (value
                          ? const Text(
                              "Show password",
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 16,
                              ),
                            )
                          : const Text(
                              "Hide password",
                              style: TextStyle(
                                color: AppColor.mainColor,
                                fontSize: 16,
                              ),
                            )),
                    )
                  : null,
              helperText: helperText ? "Forgot password?" : null,
            ),
          );
        });
  }
}
