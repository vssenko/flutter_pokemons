import 'package:flutter/material.dart';

class _TextStyles {
  late final BuildContext _context;

  final Color textColor = Colors.black;

  _TextStyles(BuildContext context) {
    _context = context;
  }
}

class _ColorStyles {
  Color get contentBackgroundColor {
    return Colors.white70;
  }

  Color get pokemonRedColor {
    return Colors.red[700]!;
  }

  Color get pokemonYellowColor {
    return Colors.yellowAccent;
  }
}

class Styles {
  late final BuildContext _context;
  late final _TextStyles textStyles;
  late final _ColorStyles colorStyles;

  Styles(BuildContext context) {
    _context = context;
    textStyles = _TextStyles(context);
    colorStyles = _ColorStyles();
  }
}
