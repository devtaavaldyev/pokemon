import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocemons_app/data/repositories/dio_settings.dart';
import 'package:pocemons_app/data/repositories/pokemon_repo.dart';
import 'package:pocemons_app/features/bloc/pokemon_cubit.dart';

import 'features/screens/pokemon_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
            create: (context) => PokemonRepo(
                dio: RepositoryProvider.of<DioSettings>(context).dio))
      ],
      child: BlocProvider(
        create: (context) => PokemonCubit(
            pokemonRepo: RepositoryProvider.of<PokemonRepo>(context))
          ..getPokemons(''),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: PokemonScreen(),
        ),
      ),
    );
  }
}
