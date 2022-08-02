import 'package:flutter/material.dart';
import 'package:great_places/models/places.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:provider/provider.dart';

import '../providers/great_place_provider.dart';

class PlaceDetailScreen extends StatelessWidget {
  final String id;
  const PlaceDetailScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Place place = Provider.of<GreatPlaces>(context).findById(id);
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 250,
            width: double.infinity,
            child: Image.file(
              place.img!,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            place.location!.address,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => MapScreen(
                      initialLocation: PlaceLocation(
                          latitude: place.location!.latitude,
                          longitude: place.location!.longitude),
                    ),
                  ),
                );
              },
              child: const Text("View Map"))
        ],
      ),
    );
  }
}
