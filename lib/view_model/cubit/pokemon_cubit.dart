import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/model/pokemon_model.dart';
import 'package:pokemon/view_model/network/remote/dio_helper.dart';
import 'package:pokemon/view_model/network/remote/endpoints.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  static PokemonCubit get(context) => BlocProvider.of<PokemonCubit>(context);

  List<Pokemon> pokemons = [];

  Future<void> getPokeData() async {
    emit(LoadingDataState());
    DioHelper.get(
      endpoint: EndPoints.endPoint,
    ).then(
      (value) {
        List<dynamic> jsonData = jsonDecode(value.data)["pokemon"];
        pokemons = jsonData
            .map((pokemonData) => Pokemon.fromJson(pokemonData))
            .toList();
        emit(DataSuccessState());
      },
    ).catchError((onError) {
      emit(DataErrorState(onError.toString()));
    });
  }
}
