import 'package:flutter/material.dart';
import 'package:pokemons/data/models/pokemon.dart';

class ScreenArguments {
  final Pokemon pokemon;
  final bool isFavorite;

  ScreenArguments({required this.pokemon, required this.isFavorite});
}

class PokemonScreen extends StatelessWidget {
  final ScreenArguments args;
  const PokemonScreen({Key? key, required this.args}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.white,
        elevation: 0.4,
      ),
      body: _body(context, args.pokemon),
      floatingActionButton: Container(
        width: 200.0,
        height: 50.0,
        child: Text(
          !args.isFavorite ? 'Mark as favourite' : 'Remove from favourites',
          style: TextStyle(
              color: !args.isFavorite ? Colors.white : Colors.indigo,
              fontWeight: FontWeight.bold,
              fontSize: 14.0),
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.0),
            color: !args.isFavorite ? Colors.indigo : Colors.indigo[100]),
        alignment: Alignment.center,
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  Widget _body(context, pokemon) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(pokemon.image)),
                color: Colors.green[50]),
            height: 250.0,
            width: MediaQuery.of(context).size.width,
          ),
          _pokemon_details(context),
          Expanded(
            child: _pokemon_stats(context),
          )
        ],
      ),
    );
  }

  Widget _pokemon_details(context) {
    return Container(
      child: Row(
        children: [
          single_detail(title: "Height", value: "69"),
          single_detail(title: "Weight", value: "7"),
          single_detail(title: "BMI", value: "14"),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
      height: 80.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
      margin: EdgeInsets.only(bottom: 10.0),
    );
  }

  Widget single_detail({title, value}) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(title),
          ),
          Text(value)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
      alignment: Alignment.center,
      width: 100.0,
      margin: EdgeInsets.only(right: 10.0),
    );
  }

  Widget _pokemon_stats(context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
