import 'package:flutter/material.dart';
import '../widgets/layout.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        title: 'Not found',
        content: Container(
          color: Colors.blue[50],
          alignment: Alignment.center,
          padding: const EdgeInsets.only(top: 50),
          child:
              Text('Not found', style: Theme.of(context).textTheme.headline6),
        ));
  }
}
