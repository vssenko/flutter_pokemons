import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../utils/styles/styles.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var styles = Styles(context);
    return SpinKitRotatingCircle(color: styles.colorStyles.pokemonRedColor);
  }
}
