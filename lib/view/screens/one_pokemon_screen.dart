import 'package:flutter/material.dart';
import 'package:pokemon/view/components/poke_details_types.dart';
import 'package:pokemon/view/components/poke_details_weaknesses.dart';
import 'package:pokemon/view/components/text_custom.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

class OnePokemonScreen extends StatelessWidget {
  const OnePokemonScreen({
    super.key,
    this.pokemon,
  });

  final dynamic pokemon;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cyan.withOpacity(0.9),
      appBar: AppBar(
        title: TextCustom(
          data: pokemon["name"],
          color: AppColors.whiteText,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: const EdgeInsets.symmetric(
              vertical: 100,
              horizontal: 20,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(
                  height: 50,
                ),
                TextCustom(
                  data: pokemon["name"],
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  data: "Height: ${pokemon["height"]}",
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                ),
                TextCustom(
                  data: "Weight: ${pokemon["weight"]}",
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                ),
                const TextCustom(
                  data: "Types",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                //row of types
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 30,
                    ),
                    itemBuilder: (context, index) =>
                        TypesOfOnePoke(data: pokemon["type"][index]),
                    itemCount: pokemon["type"].length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                const TextCustom(
                  data: "Weaknesses",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                //row of weekness
                SizedBox(
                  height: 35,
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 30,
                    ),
                    itemBuilder: (context, index) =>
                        WeaknessesOfOnePoke(data: pokemon["weaknesses"][index]),
                    itemCount: pokemon["weaknesses"].length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 40,
            child: Hero(
              tag: pokemon["img"],
              child: Image(
                image: NetworkImage(
                  pokemon["img"],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
