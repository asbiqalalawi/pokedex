import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/pokedex_model.dart';
import '../service/pokedex_service.dart';

part 'pokedex_event.dart';
part 'pokedex_state.dart';

class PokedexBloc extends Bloc<PokedexEvent, PokedexState> {
  final PokedexService _service;
  PokedexBloc(this._service) : super(PokedexInitial()) {
    PokedexModel? pokedex;

    on<GetPokedexEvent>((event, emit) async {
      try {
        emit(PokedexLoading());
        pokedex = await _service.getPokedex(event.url);
        emit(PokedexSuccess(pokedex: pokedex!));
      } catch (e) {
        emit(PokedexFailed(message: e.toString()));
      }
    });

    on<GetMorePokedexEvent>((event, emit) async {
      try {
        final newPokedex = await _service.getPokedex(event.url);
        pokedex?.results.addAll(newPokedex.results);
        emit(PokedexSuccess(pokedex: pokedex!));
      } catch (e) {
        emit(PokedexFailed(message: e.toString()));
      }
    });
  }
}
