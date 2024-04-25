import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pokedex/style/colors.dart';

import 'bloc/pokedex_bloc.dart';
import 'bloc/pokemon_bloc.dart';
import 'route/route.dart';
import 'service/pokedex_service.dart';
import 'service/pokemon_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PokedexBloc(PokedexService())),
        BlocProvider(create: (context) => PokemonBloc(PokemonService())),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Identity.primary),
          useMaterial3: true,
          textTheme: GoogleFonts.poppinsTextTheme(),
        ),
        routerConfig: router,
      ),
    );
  }
}
