import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  final double width;
  final double height;
  final Color color;

  const CustomLoader({
    Key? key,
    this.width = 25,
    this.height = 25,
    this.color = Colors.white
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: CircularProgressIndicator(color: color)
    );
  }
}
