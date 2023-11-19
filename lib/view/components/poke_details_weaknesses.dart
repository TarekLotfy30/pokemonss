import 'package:flutter/material.dart';
import 'package:pokemon/view/components/text_custom.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

class WeaknessesOfOnePoke extends StatelessWidget {
  const WeaknessesOfOnePoke({
    super.key,
    required this.data,
  });

  final String data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
          color: AppColors.weaknessColorBackground,
          borderRadius: BorderRadius.circular(30)),
      child: TextCustom(
        data: data,
        fontSize: 15,
        fontWeight: FontWeight.w200,
        color: AppColors.whiteText,
      ),
    );
  }
}
