import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/great_place_provider.dart';
import '../screens/add_place_screen.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: Consumer<GreatPlaces>(
        child: Center(
            child: TextButton(
          child: const Text("You have no places yet, Add a new place now"),
          onPressed: () {
            Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
          },
        )),
        builder: (BuildContext context, greatPlaces, Widget? child) {
          return greatPlaces.items.isEmpty
              ? child!
              : ListView.builder(
                  itemCount: greatPlaces.items.length,
                  itemBuilder: (context, i) {
                    return Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: FileImage(greatPlaces.items[i].img!),
                        ),
                        title: Text(greatPlaces.items[i].name),
                        onTap: () {},
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
