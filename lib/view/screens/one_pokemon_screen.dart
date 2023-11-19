import 'package:flutter/material.dart';
import 'package:pokemon/view/components/poke_details_types.dart';
import 'package:pokemon/view/components/poke_details_weaknesses.dart';
import 'package:pokemon/view/components/text_custom.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

import '../../model/pokemon_model.dart';

class OnePokemonScreen extends StatelessWidget {
  const OnePokemonScreen({
    super.key,
    required this.pokemonObject,
  });

  final Pokemon pokemonObject;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: TextCustom(
          data: pokemonObject.name ?? "",
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
              vertical: 90,
              horizontal: 20,
            ),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.containerBackground.withOpacity(0.6),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 20,
                ),
                TextCustom(
                  data: pokemonObject.name ?? "",
                  fontWeight: FontWeight.bold,
                ),
                TextCustom(
                  data: "Height: ${pokemonObject.height}",
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                ),
                TextCustom(
                  data: "Weight: ${pokemonObject.weight}",
                  fontWeight: FontWeight.w200,
                  fontSize: 15,
                ),
                const TextCustom(
                  data: "Types",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                //row of types
                Wrap(
                  spacing: 30,
                  children: List.generate(
                    pokemonObject.type!.length,
                    (index) => TypesOfOnePoke(data: pokemonObject.type![index]),
                  ),
                ),

                const TextCustom(
                  data: "Weaknesses",
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                //row of weekness
                SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    spacing: 30,
                    alignment: WrapAlignment.center,
                    runSpacing: 10,
                    children: List.generate(
                      pokemonObject.weaknesses!.length,
                      (index) => WeaknessesOfOnePoke(
                          data: pokemonObject.weaknesses![index]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          PositionedDirectional(
            top: 20,
            child: Hero(
              tag: pokemonObject.img ?? "",
              child: Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  pokemonObject.img ?? "",
                ),
                height: 150, // Set the desired height for the image
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//ssss
