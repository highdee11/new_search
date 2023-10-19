import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newsapp/core/config/brand_config.dart';

class LeadingIcon extends StatelessWidget {
  final Widget? child;
  final Function()? onTap;
  const LeadingIcon({Key? key, this.child, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: GestureDetector(
        child: CircleAvatar(
          backgroundColor: BrandStyleConfig.primary.withOpacity(0.09),
          child: child,
        ),
        onTap: (){
          if(onTap != null) {
            onTap!();
          }else{
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
