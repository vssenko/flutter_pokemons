import 'package:flutter/material.dart';
import '../../models/pokemon.dart';
import '../../utils/dimensions.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;
  const PokemonCard({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(pokemon!.picture!,
            width: Dimensions.getPercentWidth(context, 90), errorBuilder:
                (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
          return const Text('No image');
        }),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text(pokemon!.cname!), Text(pokemon!.jname!)],
          ),
        ),
        const Divider(color: Colors.black),
        if (pokemon!.base != null)
          SkillsDescription(
            pokemon: pokemon!,
          )
      ],
    );
  }
}

class SkillsDescription extends StatelessWidget {
  final Pokemon pokemon;
  const SkillsDescription({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Attack ${pokemon.base!.Attack}'),
            Text('Defense ${pokemon.base!.Defense}'),
            Text('HP ${pokemon.base!.HP}')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('SpAttack ${pokemon.base!.SpAttack}'),
            Text('SpDefense ${pokemon.base!.SpDefense}'),
            Text('Speed ${pokemon.base!.Speed}')
          ],
        )
      ],
    );
  }
}
