import 'package:flutter/material.dart';
import 'package:newsapp/core/config/brand_config.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class CustomOutlineInputBox extends StatelessWidget {
  final String label;
  final String hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? prefixIcon;
  final bool autofocus;

  const CustomOutlineInputBox({Key? key,
    required this.label,
    required this.hintText,
    this.validator,
    this.prefixIcon,
    this.controller,
    this.autofocus = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Theme.of(context).colorScheme.tertiary, fontSize: 16,
                fontWeight: FontWeight.w500 )
        ),
        const SizedBox(height: 5),
        SizedBox(

          child: TextFormField(
            controller: controller,
            style: const TextStyle(
              fontSize: 14,
            ),
            validator: validator,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              contentPadding: const EdgeInsets.symmetric(horizontal: 13, vertical: 18),
              border: const OutlineInputBorder(),
              hintText: hintText,
              hintStyle: const TextStyle(
                fontSize: 14,
                color: Color(0xffB8BCC6),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.grey)
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: BrandStyleConfig.primary)
              )
            ),
            autofocus: autofocus,
          ),
        ),
      ],
    );
  }
}

