import 'dart:io';

import 'package:flutter/material.dart';

import '../models/places.dart';
import '../helpers/db_helpers.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedName, File? pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      name: pickedName,
      location: null,
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
            location: null,
            img: File(e["image"]),
          ),
        )
        .toList();
    notifyListeners();
  }
}
