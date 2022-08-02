import 'package:flutter/material.dart';
import 'package:great_places/screens/place_detail_screen.dart';
import 'package:provider/provider.dart';

import '../providers/great_place_provider.dart';
import '../screens/add_place_screen.dart';

class PlaceList extends StatelessWidget {
  const PlaceList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final great = Provider.of<GreatPlaces>(context, listen: false);

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
      body: FutureBuilder(
        future: great.fetchAndSetPlaces(),
        builder: (ctx, snapShot) => snapShot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: Center(
                    child: TextButton(
                  child:
                      const Text("You have no places yet, Add a new place now"),
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
                                  backgroundImage:
                                      FileImage(greatPlaces.items[i].img!),
                                ),
                                title: Text(greatPlaces.items[i].name),
                                subtitle: Text(
                                    greatPlaces.items[i].location!.address),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return PlaceDetailScreen(
                                            id: greatPlaces.items[i].id);
                                      },
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                },
              ),
      ),
    );
  }
}
