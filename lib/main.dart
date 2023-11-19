import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/view/screens/all_pokemons_screen.dart';
import 'package:pokemon/view_model/cubit/pokemon_cubit.dart';
import 'package:pokemon/view_model/network/remote/dio_helper.dart';
import 'package:pokemon/view_model/utiles/colors.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokemonCubit()..getPokeData()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.blueGrey,
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 60,
          ),
          scaffoldBackgroundColor: Colors.blueGrey,
          fontFamily: "NotoSans",
          iconTheme: const IconThemeData(
            size: 30,
            color: AppColors.whiteText,
          ),
        ),
        home: const AllPokemonsScreen(),
      ),
    );
  }
}
