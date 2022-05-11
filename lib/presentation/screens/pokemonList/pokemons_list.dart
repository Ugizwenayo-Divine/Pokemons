import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/presentation/screens/pokemonList/cubit/pokemon_list_cubit.dart';
import 'package:pokemons/presentation/widgets/pokemons/favourite_pokemons_widget.dart';
import 'package:pokemons/presentation/widgets/pokemons/pokemons_list_widget.dart';
import 'package:pokemons/presentation/widgets/pokemons/title_widget.dart';

class PokemonsList extends StatefulWidget {
  const PokemonsList({Key? key}) : super(key: key);
  @override
  PokemonsListSate createState() => PokemonsListSate();
}

class PokemonsListSate extends State<PokemonsList> {
  final String titleLogo = 'assets/images/Logo.svg';

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<PokemonListCubit>(context).getPokemons();
    return DefaultTabController(
        length: 2,
        child: Builder(builder: (BuildContext context) {
          return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Container(
                      child: TitleWidget(),
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 15.0),
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Colors.grey),
                        ),
                      ),
                    ),
                    titleSpacing: 0.0,
                    titleTextStyle: TextStyle(fontFamily: "Noto Sans"),
                    backgroundColor: Colors.white,
                    leadingWidth: MediaQuery.of(context).size.width,
                    elevation: 1,
                    floating: true,
                    pinned: false,
                    snap: true,
                    forceElevated: true,
                    bottom: TabBar(
                      tabs: [
                        Tab(
                          child: Text(
                            "All pokemons",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                        ),
                        Tab(
                          child: Row(
                            children: [
                              Text(
                                "Favourites",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0),
                                child: BlocBuilder<PokemonListCubit,
                                    PokemonListState>(
                                  builder: (context, state) {
                                    if ((state is PokemonsLoaded)) {
                                      final pokemons = (state).pokemons;

                                      return Badge(
                                        badgeContent: Text(
                                          pokemons.length.toString(),
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 10.0),
                                        ),
                                        badgeColor: Colors.indigo,
                                        padding: EdgeInsets.all(5.0),
                                      );
                                    }

                                    return Badge(
                                      badgeContent: Text(
                                        '0',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10.0),
                                      ),
                                      badgeColor: Colors.indigo,
                                      padding: EdgeInsets.all(8.0),
                                    );
                                  },
                                ),
                              )
                            ],
                            crossAxisAlignment: CrossAxisAlignment.center,
                          ),
                        ),
                      ],
                      indicatorColor: Colors.indigo,
                      indicatorWeight: 4.0,
                      mouseCursor: MouseCursor.defer,
                      labelStyle: TextStyle(fontFamily: "Noto Sans"),
                    ),
                  ),
                  SliverList(
                      delegate: SliverChildListDelegate(<Widget>[
                    BlocBuilder<PokemonListCubit, PokemonListState>(
                        builder: (context, state) {
                      if ((state is PokemonsLoaded)) {
                        final pokemons = (state).pokemons;
                        return (Container(
                          height: MediaQuery.of(context).size.height -
                              kToolbarHeight,
                          padding: EdgeInsets.only(bottom: 100.0),
                          child: TabBarView(
                            children: [
                              PokemonsListWidget(pokemons: pokemons),
                              FavouritePokemonsWidget(
                                pokemons: pokemons,
                              )
                            ],
                          ),
                        ));
                      }

                      return Container(
                          height: MediaQuery.of(context).size.height -
                              kToolbarHeight,
                          child: Center(child: CircularProgressIndicator()));
                    }),
                  ]))
                ],
              ),
              backgroundColor: Colors.white);
        }));
  }
}
