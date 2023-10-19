import 'package:flutter/material.dart';
import 'package:newsapp/widgets/custom_loader.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/config/brand_config.dart';

class CustomTextButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final double height;
  final double? width;
  final bool isLoading;

  const CustomTextButton({
    Key? key,
    required this.label,
    this.onTap,
    this.height = 50,
    this.width,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double actualWidth = width ?? MediaQuery.of(context).size.width;

    return SizedBox(
      height: height,
      width: actualWidth,
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(onTap != null ? BrandStyleConfig.primary : Colors.grey),
          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))
        ),
        child: isLoading? const CustomLoader(): Text(
          label,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.w600
          ),
        ),
      ),
    );
  }
}
