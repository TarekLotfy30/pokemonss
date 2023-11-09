part of 'pokemon_cubit.dart';

@immutable
abstract class PokemonState {}

class PokemonInitial extends PokemonState {}

class LoadingDataState extends PokemonState {}

class DataSuccessState extends PokemonState {}

class DataErrorState extends PokemonState {
  final error;

  DataErrorState(this.error);
}
