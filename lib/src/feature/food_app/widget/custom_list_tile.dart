import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/app_icons.dart';

class CustomListTile extends StatefulWidget {
  final String title;
  final String leadingIconPath;
  final String trailing;
  final void Function()? onTap;

  const CustomListTile({
    Key? key,
    required this.title,
    required this.leadingIconPath,
    this.trailing = AppIcons.icArrowRight,
    this.onTap,
  }) : super(key: key);

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  late String trailing;

  @override
  void initState() {
    trailing = widget.trailing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ListTile(
        onTap: widget.onTap,
        title: Text(widget.title),
        leading: SizedBox(
          width: 48,
          height: 48,
          child: DecoratedBox(
            decoration: const BoxDecoration(
              color: AppColor.listTilecolor,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            child: Center(
              child: Image(
                image: AssetImage(widget.leadingIconPath),
                height: 28,
                width: 28,
              ),
            ),
          ),
        ),
        trailing: Image(
          image: AssetImage(widget.trailing),
        ),
      ),
    );
  }
}
