import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screens/place_list_screen.dart';
import '../screens/add_place_screen.dart';
import '../providers/great_place_provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => GreatPlaces(),
      child: MaterialApp(
        title: 'Great Places',
        theme: theme.copyWith(
          colorScheme: theme.colorScheme.copyWith(secondary: Colors.amber),
        ),
        home: const PlaceList(),
        routes: {AddPlaceScreen.routeName: (context) => const AddPlaceScreen()},
      ),
    );
  }
}
