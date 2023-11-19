import 'package:flutter/material.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/view/components/text_custom.dart';
import 'package:pokemon/view/screens/one_pokemon_screen.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

class PokeItem extends StatelessWidget {
  const PokeItem({
    required this.pokemonObject,
    Key? key,
  }) : super(key: key);

  final Pokemon pokemonObject;

  @override
  Widget build(BuildContext context) {
    return Material(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      color: AppColors.containerBackground.withOpacity(0.6),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OnePokemonScreen(
              pokemonObject: pokemonObject,
            ),
          ),
        ),
        child: Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                child: Hero(
                  tag: pokemonObject.img ?? "",
                  child: Image.network(
                    pokemonObject.img ?? "",
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CircularProgressIndicator(
                          color: AppColors.typesTextColor,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.typesTextColor,
                        ),
                      );
                    },
                  ),
                ),
              ),
              TextCustom(
                data: pokemonObject.name ?? "",
                fontWeight: FontWeight.bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
