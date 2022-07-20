import 'dart:io';

class PlaceLocation {
  final double latitude;
  final double longitude;
  final String address;

  PlaceLocation(
      {this.address = "", required this.latitude, required this.longitude});
}

class Place {
  final String id;
  final String name;
  final PlaceLocation location;
  final File img;

  Place(
      {required this.id,
      required this.name,
      required this.location,
      required this.img});
}
