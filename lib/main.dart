import 'package:flutter/material.dart';
import 'package:pokemons/presentation/router.dart';

void main() {
  runApp(Pokemons(
    router: AppRouter(),
  ));
}

class Pokemons extends StatelessWidget {
  final AppRouter router;

  const Pokemons({Key? key, required this.router}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: router.generateRoute,
    );
  }
}
