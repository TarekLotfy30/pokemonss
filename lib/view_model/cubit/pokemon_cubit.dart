import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:pokemon/view_model/network/remote/dio_helper.dart';
import 'package:pokemon/view_model/network/remote/endpoints.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());

  static PokemonCubit get(context) => BlocProvider.of<PokemonCubit>(context);

  List<dynamic> pokemons = [];

  Future<void> getPokeData() async {
    emit(LoadingDataState());
    await Future.delayed(const Duration(seconds: 10));
    DioHelper.get(
      endpoint: EndPoints.endPoint,
    ).then(
      (value) {
        Map<String, dynamic> jsonData = jsonDecode(value.data);
        pokemons = jsonData["pokemon"];
        emit(DataSuccessState());
      },
    ).catchError((onError) {
      emit(DataErrorState(onError.toString()));
    });
  }
}
