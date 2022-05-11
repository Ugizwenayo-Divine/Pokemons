import 'package:flutter/material.dart';

class PokemonDescriptionWidget extends StatelessWidget {
  final String title;
  final String value;
  const PokemonDescriptionWidget({Key? key, this.title = "", this.value = ""})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
      width: 80.0,
      margin: EdgeInsets.only(right: 10.0),
    );
  }
}
