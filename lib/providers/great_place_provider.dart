import 'dart:io';

import 'package:flutter/material.dart';

import '../helpers/location_helper.dart';
import '../models/places.dart';
import '../helpers/db_helpers.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  Future<void> addPlace(String pickedName, File? pickedImage,
      PlaceLocation? pickedLocation) async {
    final address = await LocationHelper.getPlaceAddress(
        pickedLocation!.latitude, pickedLocation.longitude);
    final updatedLocation = PlaceLocation(
        latitude: pickedLocation.latitude,
        longitude: pickedLocation.longitude,
        address: address);
    final newPlace = Place(
      id: DateTime.now().toString(),
      name: pickedName,
      location: updatedLocation,
      img: pickedImage,
    );

    _items.add(newPlace);
    notifyListeners();
    DbHelper.insert(
      "user_places",
      {
        "id": newPlace.id,
        "title": newPlace.name,
        "image": newPlace.img!.path,
        "loc_lat": newPlace.location!.latitude,
        "loc_lng": newPlace.location!.longitude,
        "address": newPlace.location!.address,
      },
    );
  }

  Future<void> fetchAndSetPlaces() async {
    final dataList = await DbHelper.getData("user_places");
    _items = dataList
        .map(
          (e) => Place(
            id: e["id"] as String,
            name: e["title"] as String,
            location: PlaceLocation(
                latitude: e["loc_lat"] as double,
                longitude: e["loc_lng"] as double,
                address: e["address"] as String),
            img: File(e["image"]),
          ),
        )
        .toList();
    notifyListeners();
  }
}
