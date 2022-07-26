import 'dart:io';

import 'package:flutter/material.dart';
import 'package:great_places/models/places.dart';
import 'package:provider/provider.dart';

import "../widgets/image_input.dart";
import "../widgets/location_input.dart";
import '../providers/great_place_provider.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  static const routeName = "/add-place";

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();
  File? _pickedImage;
  PlaceLocation? _selectedLocation;

  void _selectImage(File? pickedImage) {
    _pickedImage = pickedImage;
  }

  void _savePlace() {
    if (_titleController.text.isEmpty ||
        _pickedImage == null ||
        _selectedLocation == null) {
      //  print("${_selectedLocation.address} is the address ");
      return;
    }

    Provider.of<GreatPlaces>(context, listen: false)
        .addPlace(_titleController.text, _pickedImage, _selectedLocation);
    Navigator.of(context).pop();
  }

  void _selectPlace(double lat, double lon) {
    _selectedLocation = PlaceLocation(latitude: lat, longitude: lon);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a New Place")),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: const InputDecoration(labelText: "Title"),
                      controller: _titleController,
                    ),
                    const SizedBox(height: 10),
                    ImageInput(_selectImage),
                    const SizedBox(height: 10),
                    LocationInput(_selectPlace)
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {
                _savePlace();
              },
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  primary: Colors.amber),
              icon: const Icon(Icons.add),
              label: const Text("Add Place"))
        ],
      ),
    );
  }
}
