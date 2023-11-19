import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/view/components/poke_item_component.dart';
import 'package:pokemon/view/components/text_custom.dart';
import 'package:pokemon/view_model/cubit/pokemon_cubit.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

class AllPokemonsScreen extends StatelessWidget {
  const AllPokemonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextCustom(
          data: "Poke App",
          color: AppColors.whiteText,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<PokemonCubit, PokemonState>(
          builder: (context, state) {
            var cubit = PokemonCubit.get(context);

            if (state is LoadingDataState) {
              return Center(
                child: CircularProgressIndicator(
                  color: AppColors.containerBackground.withOpacity(0.6),
                ),
              );
            }

            return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(10),
                itemBuilder: (BuildContext context, int index) => PokeItem(
                      pokemonObject: cubit.pokemons[index],
                    ),
                itemCount: 10 //cubit.pokemons.length,
                );
          },
        ),
      ),
    );
  }
}
