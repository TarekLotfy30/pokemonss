import 'package:flutter/material.dart';
import 'package:pokemon/view/components/text_custom.dart';
import 'package:pokemon/view/screens/one_pokemon_screen.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

class PokeItem extends StatelessWidget {
  const PokeItem(
    this.pokemon, {
    super.key,
  });

  final dynamic pokemon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnePokemonScreen(
                    pokemon: pokemon,
                  )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.containerBackground,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 9,
              offset: const Offset(1, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          children: [
            Expanded(
              child: Hero(
                tag: pokemon["img"],
                child: Image(
                  image: NetworkImage(
                    pokemon["img"],
                  ),
                ),
              ),
            ),
            TextCustom(
              data: pokemon["name"],
              fontWeight: FontWeight.bold,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
