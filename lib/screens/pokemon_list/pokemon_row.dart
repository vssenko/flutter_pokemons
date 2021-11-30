import 'package:flutter/material.dart';
import '../../models/pokemon.dart';
import '../../utils/dimensions.dart';
import '../../utils/routes.dart';

const rowHeight = 100.0;

class PokemonRow extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonRow({Key? key, required this.pokemon}) : super(key: key);

  void _openPokemonPage(BuildContext context) {
    Navigator.pushNamed(context, Routes.pokemon(pokemon.id));
  }

  @override
  Widget build(BuildContext context) {
    try {
      return InkWell(
          onTap: () => _openPokemonPage(context),
          child: Container(
            width: double.infinity,
            height: rowHeight * 1.15,
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(
                        left: Dimensions.getPercentWidth(context, 5)),
                    child: Image.network(
                      pokemon.picture!,
                      height: rowHeight,
                      width: rowHeight,
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Text('No image');
                      },
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(
                          right: Dimensions.getPercentWidth(context, 15)),
                      child: Text(
                        pokemon.name!,
                        style: Theme.of(context).textTheme.headline5,
                      ))
                ]),
          ));
    } catch (e) {
      return Text('Failed to show data');
    }
  }
}
