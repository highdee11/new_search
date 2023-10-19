import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'leading_icon.dart';

class CustomTextAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final double height;
  final Widget? leading;

  const CustomTextAppBar({
    Key? key,
    required this.title,
    this.height = kToolbarHeight,
    this.leading

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      leadingWidth: 52,
      leading: leading,
      title: Text(title,
          style: Theme.of(context).textTheme.headlineSmall?.
          copyWith(color: Colors.black,
              fontWeight: FontWeight.w600,
            fontSize: 16.8.sp
          )),
      centerTitle: true,
    );
  }


  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);
}
