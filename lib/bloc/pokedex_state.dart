part of 'pokedex_bloc.dart';

@immutable
sealed class PokedexState {}

final class PokedexInitial extends PokedexState {}

final class PokedexLoading extends PokedexState {}

final class PokedexSuccess extends PokedexState {
  final PokedexModel pokedex;

  PokedexSuccess({required this.pokedex});
}

final class PokedexFailed extends PokedexState {
  final String message;

  PokedexFailed({required this.message});
}
