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
  LatLng? _pickedLocation;
  void _selectLocation(LatLng position) {
    setState(() {
      _pickedLocation = position;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Location"),
      ),
      body: GoogleMap(
        markers: _pickedLocation != null
            ? {
                Marker(
                    markerId: const MarkerId("m1"), position: _pickedLocation!)
              }
            : {},
        onTap: widget.isSelecting ? _selectLocation : null,
        initialCameraPosition: CameraPosition(
            target: LatLng(
              widget.initialLocation.latitude,
              widget.initialLocation.longitude,
            ),
            zoom: 14.0),
      ),
    );
  }
}
