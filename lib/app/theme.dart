import 'package:flutter/material.dart';
import '../utils/styles/styles.dart';

ThemeData buildAppTheme(BuildContext context) {
  final styles = Styles(context);

  final defaultTextStyle = TextStyle(color: styles.textStyles.textColor);
  final oneAndOnlyTextTheme = TextTheme(
    headline1:
        defaultTextStyle.copyWith(fontSize: 53, fontWeight: FontWeight.bold),
    headline6: defaultTextStyle.copyWith(fontSize: 24.0),
    bodyText1: defaultTextStyle.copyWith(fontSize: 16.0),
    bodyText2: defaultTextStyle.copyWith(fontSize: 16.0),
  );

  //TODO: finish
  return ThemeData(
      primaryColor: styles.colorStyles.pokemonRedColor,
      fontFamily: 'Georgia',
      primaryTextTheme: oneAndOnlyTextTheme,
      textTheme: oneAndOnlyTextTheme,
      appBarTheme: AppBarTheme(
        backgroundColor: styles.colorStyles.pokemonRedColor,
      ));
}
