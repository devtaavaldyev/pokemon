// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pocemons_app/data/model/pokemon_model.dart';
import 'package:pocemons_app/data/repositories/pokemon_repo.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit({required this.pokemonRepo})
      : super(LoadingState(pokemonModel: []));

  final PokemonRepo pokemonRepo;
  int currentPage = 0;
  late final int maxPage;
  List<PokemonModel> pokemonsModel = [];

  getPokemons(String? name) async {
    emit(LoadingState(pokemonModel: state.pokemonModel));

    currentPage++;

    try {
      final result = await pokemonRepo.getResult(
        name: name!,
        currentPage: currentPage,
      );
      final PokemonInformationModel pokemon =
          PokemonInformationModel.fromJson(result.data);
      pokemonsModel.addAll(pokemon.results!);
      emit(SuccesState(pokemonModel: pokemonsModel));
    } catch (e) {
      if (e is DioError) {
        if (e.type == DioErrorType.other) {
          emit(
            ErrorState(
              message: 'Нет Подключение к интернету',
              pokemonModel: [],
            ),
          );
        }

        if (e.response!.statusCode == 404) {
          emit(
            ErrorState(
              message: 'Нет Персонаж с таким именем!',
              pokemonModel: [],
            ),
          );
        }
      }
    }
  }
}

abstract class PokemonState {
  final List<PokemonModel> pokemonModel;
  PokemonState({
    required this.pokemonModel,
  });
}

class SuccesState extends PokemonState {
  final List<PokemonModel> pokemonModel;
  SuccesState({
    required this.pokemonModel,
  }) : super(pokemonModel: pokemonModel);
}

class InitialState extends PokemonState {
  final List<PokemonModel> pokemonModel;
  InitialState({
    required this.pokemonModel,
  }) : super(pokemonModel: pokemonModel);
}

class LoadingState extends PokemonState {
  final List<PokemonModel> pokemonModel;
  LoadingState({
    required this.pokemonModel,
  }) : super(pokemonModel: pokemonModel);
}

class ErrorState extends PokemonState {
  ErrorState({required this.message, required this.pokemonModel})
      : super(pokemonModel: pokemonModel);
  final List<PokemonModel> pokemonModel;
  final String message;
}
