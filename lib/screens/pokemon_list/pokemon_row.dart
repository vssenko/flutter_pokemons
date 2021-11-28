import 'package:flutter/material.dart';
import '../../models/pokemon.dart';
import '../../utils/dimensions.dart';

const rowHeight = 100.0;

class PokemonRow extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonRow({Key? key, required this.pokemon}) : super(key: key);

  void _openPokemonPage() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: _openPokemonPage,
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
                  child: Image(
                    height: rowHeight,
                    width: rowHeight,
                    image: NetworkImage(pokemon.picture!),
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
  }
}
