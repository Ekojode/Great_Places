import 'package:flutter/material.dart';

import "../widgets/image_input.dart";

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({Key? key}) : super(key: key);

  static const routeName = "/add-place";

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  final TextEditingController _titleController = TextEditingController();

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
                    const ImageInput(),
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton.icon(
              onPressed: () {},
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
