import 'package:flutter/material.dart';

import './screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.indigo,
    );
    return MaterialApp(
      title: 'Great Places',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
      ),
      home: const Home(),
    );
  }
}
