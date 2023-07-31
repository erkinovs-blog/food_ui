import 'package:flutter/material.dart';
import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    this.isFavouriteTextField = false,
    this.onChanged,
    super.key,
    required this.onTap,
  });

  final bool isFavouriteTextField;
  final TextEditingController controller;
  final void Function(String value)? onChanged;
  final void Function() onTap;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late final FocusNode focusNode;

  ValueNotifier<String> text = ValueNotifier("");

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      text.value = widget.controller.text;
    });
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  Widget? suffixIcon(String value) {
    if (widget.isFavouriteTextField && value.isNotEmpty) {
      return IconButton(
        onPressed: () => widget.controller.text = "",
        icon: const Icon(Icons.clear),
      );
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: text,
        builder: (context, value, child) {
          return TextField(
            onTap: widget.onTap,
            onTapOutside: (event) {
              focusNode.unfocus();
            },
            focusNode: focusNode,
            onChanged: widget.onChanged,
            controller: widget.controller,
            decoration: InputDecoration(
              border: buildOutlineInputBorder(),
              enabledBorder: buildOutlineInputBorder(),
              focusedBorder: buildOutlineInputBorder(),
              filled: true,
              fillColor: AppColor.textFieldBKG,
              prefixIcon: const Padding(
                padding:
                    EdgeInsets.only(left: 20, top: 15, right: 9, bottom: 15),
                child: Image(
                    image: AssetImage(AppIcons.icSearch),
                    width: 16,
                    height: 16),
              ),
              suffixIcon: suffixIcon(value),
              hintText: "Search recipes, articles, people...",
              hintStyle: const TextStyle(
                color: AppColor.textFieldHintColor,
                fontSize: 16,
                fontWeight: FontWeight.w400,
                letterSpacing: -0.24,
                overflow: TextOverflow.ellipsis,
              ),
              contentPadding: const EdgeInsets.all(0),
            ),
          );
        });
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(24),
      ),
      borderSide: BorderSide.none,
    );
  }
}
