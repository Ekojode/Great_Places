import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:great_places/screens/map_screen.dart';
import 'package:location/location.dart';

import '../helpers/location_helper.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({Key? key}) : super(key: key);

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String? _previewImageUrl;
  Future<void> _getUserCurrentLocation() async {
    final locData = await Location().getLocation();

    final userLocation = LocationHelper.getLocationPreviewImg(
        longitude: locData.longitude!, latitude: locData.latitude!);
    setState(() {
      _previewImageUrl = userLocation;
    });
  }

  Future<void> _selectLocationOnMap() async {
    final selectedLocation = await Navigator.of(context).push<LatLng>(
      MaterialPageRoute(
        builder: (context) {
          return const MapScreen(isSelecting: true);
        },
      ),
    );
    if (selectedLocation == null) {
      return;
    }
    print("${selectedLocation.latitude} is the selected Location latitude");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: _previewImageUrl == null
              ? const Text("No Location Chosen")
              : Image.network(
                  _previewImageUrl!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextButton.icon(
              onPressed: _getUserCurrentLocation,
              icon: const Icon(Icons.location_on),
              label: const Text("Current Location"),
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            ),
            TextButton.icon(
              onPressed: _selectLocationOnMap,
              icon: const Icon(Icons.map),
              label: const Text("Select on Map"),
              style:
                  TextButton.styleFrom(primary: Theme.of(context).primaryColor),
            )
          ],
        )
      ],
    );
  }
}
