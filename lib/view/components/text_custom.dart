import 'package:flutter/material.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

class TextCustom extends StatelessWidget {
  final String data;
  final FontWeight? fontWeight;
  final Color? color;
  final double? fontSize;
  final double? letterSpacing;
  final TextAlign? textAlign;

  const TextCustom({
    super.key,
    this.fontWeight,
    this.color = AppColors.black,
    this.fontSize = 20,
    required this.data,
    this.letterSpacing,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: fontSize,
        letterSpacing: letterSpacing,
      ),
    );
  }
}
