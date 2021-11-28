import 'package:flutter/material.dart';
import '../utils/styles/styles.dart';

ThemeData buildAppTheme(BuildContext context) {
  final styles = Styles(context);

  final defaultTextStyle = TextStyle(color: styles.textStyles.textColor);

  //TODO: finish
  return ThemeData(
      primaryColor: styles.colorStyles.pokemonRedColor,
      fontFamily: 'Georgia',
      textTheme: TextTheme(
        headline1: defaultTextStyle.copyWith(
            fontSize: 72.0, fontWeight: FontWeight.bold),
        headline6: defaultTextStyle.copyWith(fontSize: 36.0),
        bodyText1:
            defaultTextStyle.copyWith(fontSize: 14.0, fontFamily: 'Hind'),
        bodyText2:
            defaultTextStyle.copyWith(fontSize: 14.0, fontFamily: 'Hind'),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: styles.colorStyles.pokemonRedColor,
          shadowColor: styles.colorStyles.pokemonYellowColor));
}
