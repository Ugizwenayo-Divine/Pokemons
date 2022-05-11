import 'package:flutter/material.dart';
import 'package:pokemons/presentation/widgets/pokemon/pokemon_stat_widget.dart';

class PokemonStatsWidget extends StatelessWidget {
  final List<dynamic> stats;
  const PokemonStatsWidget({Key? key, required this.stats}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              "Base stats",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            padding: const EdgeInsets.only(bottom: 10.0, top: 10.0, left: 20.0),
            decoration: BoxDecoration(
                border: Border(
              bottom: BorderSide(color: Colors.grey),
            )),
            width: MediaQuery.of(context).size.width,
          ),
          Expanded(
            child: SafeArea(
                child: Container(
              child: Column(
                children: stats
                    .map<Widget>((e) => PokemonStatWidget(
                          stat: e,
                        ))
                    .toList(),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
              ),
              padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
            )),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
      ),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.white),
    );
  }
}
