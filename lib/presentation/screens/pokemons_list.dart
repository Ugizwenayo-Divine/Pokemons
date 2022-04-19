import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemons/cubit/pokemon_list_cubit.dart';
import 'package:pokemons/presentation/screens/pokemon.dart';

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
              appBar: AppBar(
                title: Container(
                  child: _title(),
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
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
                toolbarHeight: 80.0,
                elevation: 0,
                bottom: TabBar(
                  tabs: [
                    Tab(
                      child: Text(
                        "All pokemons",
                        style: TextStyle(color: Colors.black, fontSize: 16.0),
                      ),
                    ),
                    Tab(
                      child: Row(
                        children: [
                          Text(
                            "Favourites",
                            style:
                                TextStyle(color: Colors.black, fontSize: 16.0),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Badge(
                              badgeContent: Text(
                                '1',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 10.0),
                              ),
                              badgeColor: Colors.indigo,
                              padding: EdgeInsets.all(8.0),
                            ),
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                  ],
                  indicatorColor: Colors.indigo,
                  indicatorWeight: 4.0,
                  isScrollable: false,
                  mouseCursor: MouseCursor.defer,
                  labelStyle: TextStyle(fontFamily: "Noto Sans"),
                ),
              ),
              body: BlocBuilder<PokemonListCubit, PokemonListState>(
                  builder: (context, state) {
                if ((state is PokemonsLoaded)) {
                  final pokemons = (state).pokemons;
                  return TabBarView(children: [
                    _pokemons(context, pokemons),
                    _favourites(context, pokemons)
                  ]);
                }
                return Center(child: CircularProgressIndicator());
              }),
              backgroundColor: Colors.grey[300]);
        }));
  }

  Widget _title() {
    return Row(
      children: [
        Image(
          image: AssetImage('assets/images/logo_pic.png'),
          alignment: Alignment.centerLeft,
          height: 25.0,
          width: 25.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Text(
            "Pokedex",
            style: TextStyle(
                color: Colors.black,
                fontSize: 24.0,
                fontWeight: FontWeight.bold),
          ),
        ),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  Widget _pokemon(context, isFavourite, pokemon) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, '/pokemon',
            arguments:
                ScreenArguments(pokemon: pokemon, isFavorite: isFavourite)),
        BlocProvider.of<PokemonListCubit>(context)
            .getPokemonDetails(pokemon.id),
      },
      child: Container(
        child: Column(
          children: [
            Container(
              child: Image(
                image: NetworkImage(pokemon.image),
                height: 120.0,
                width: 120.0,
              ),
              decoration: BoxDecoration(color: Colors.red[50]),
            ),
            Container(
              padding: const EdgeInsets.only(top: 15.0),
              child: Column(
                children: [
                  Text(
                    '# ${pokemon.id}',
                    style: TextStyle(fontFamily: "Noto Sans"),
                  ),
                  Text(pokemon.name,
                      style: TextStyle(
                          fontFamily: "Noto Sans",
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600)),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
            )
          ],
        ),
        decoration: BoxDecoration(color: Colors.white),
        height: 180.0,
      ),
    );
  }

  Widget _pokemons(context, pokemons) {
    if (pokemons != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: Wrap(
            children: pokemons
                .map<Widget>((pokemon) => _pokemon(context, false, pokemon))
                .toList(),
            direction: Axis.horizontal,
            spacing: 10.0,
            runSpacing: 20.0,
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
          ),
        ),
      );
    }
    return Center(child: CircularProgressIndicator());
  }

  Widget _favourites(context, pokemons) {
    if (pokemons != null) {
      return Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          direction: Axis.horizontal,
          runSpacing: 20.0,
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.start,
          children: pokemons
              .map<Widget>(
                (pokemon) => _pokemon(context, true, pokemon),
              )
              .toList(),
        ),
      );
    }
    return Center(child: CircularProgressIndicator());
  }
}
