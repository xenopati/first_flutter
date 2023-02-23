import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

main() {
  var rawJson = '{"url": "http://jsonplaceholder.typicode.com", "id": 1}';
  var parsedJson = json.decode(rawJson);
  var imageModel = new ImageModel.fromJson(parsedJson);
  print(imageModel.url);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;

  void fetchImage() {
    counter += 1;
    get(Uri.parse('https://jsonplaceholder.typicode.com/photos/$counter'));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Let\'s See Images !'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}

class ImageModel {
  int? id;
  String? url;
  String? title;

  ImageModel(this.id, this.url, this.title);
  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    url = parsedJson['url'];
    title = parsedJson['title'];
  }
}
