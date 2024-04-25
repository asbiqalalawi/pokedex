import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../components/filter_button.dart';
import '../bloc/pokedex_bloc.dart';
import '../components/search_textfield.dart';
import '../const/service_const.dart';
import '../components/pokemon_card.dart';
import '../style/colors.dart';
import '../style/elevation.dart';
import '../style/typography.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  int limit = 16;

  bool isBottom = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    context.read<PokedexBloc>().add(GetPokedexEvent(url: '$baseUrl/pokemon/?offset=0&limit=$limit'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Identity.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/icons/ic_pokeball.svg',
                        width: 24,
                        colorFilter: const ColorFilter.mode(
                          GrayScale.white,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Text(
                        'Pokédex',
                        style: Header.headline.copyWith(color: GrayScale.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  const Row(
                    children: [
                      Flexible(
                        child: SearchTextfield(),
                      ),
                      SizedBox(width: 24),
                      FilterButton(),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  boxShadow: InnerShadow.dp2,
                  borderRadius: BorderRadius.circular(8),
                  color: GrayScale.white,
                ),
                child: BlocBuilder<PokedexBloc, PokedexState>(
                  builder: (context, state) {
                    if (state is PokedexSuccess) {
                      final results = state.pokedex.results;
                      _scrollController.addListener(() {
                        if ((_scrollController.position.pixels == _scrollController.position.maxScrollExtent) &&
                            state.pokedex.next != null) {
                          context.read<PokedexBloc>().add(GetMorePokedexEvent(url: state.pokedex.next!));
                        }
                      });

                      return SingleChildScrollView(
                        controller: _scrollController,
                        child: Column(
                          children: [
                            const SizedBox(height: 24),
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                mainAxisSpacing: 12,
                                crossAxisCount: 3,
                                crossAxisSpacing: 6,
                              ),
                              itemCount: results.length + 1,
                              itemBuilder: (BuildContext context, int index) {
                                if (index < results.length) {
                                  return PokemonCard(url: results[index].url);
                                }
                                if (state.pokedex.next != null) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                            const SizedBox(height: 24),
                          ],
                        ),
                      );
                    } else if (state is PokedexFailed) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is PokedexLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
