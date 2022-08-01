import "package:flutter/material.dart";

import "package:google_maps_flutter/google_maps_flutter.dart";
import "../models/places.dart";

class MapScreen extends StatefulWidget {
  final PlaceLocation initialLocation;
  final bool isSelecting;
  const MapScreen(
      {Key? key,
      this.initialLocation =
          const PlaceLocation(latitude: 6.605874, longitude: 3.349149),
      this.isSelecting = false})
      : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Location"),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.longitude,
            ),
            zoom: 16),
      ),
    );
  }
}
