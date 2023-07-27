import 'package:flutter/material.dart';

class Kitten {
  const Kitten(
      {required this.name,
      required this.age,
      required this.imageURL,
      required this.description});
  final String name;
  final int age;
  final String imageURL;
  final String description;
}

class KittenApp extends StatelessWidget {
  const KittenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: const IconButton(onPressed: null, icon: Icon(Icons.menu)),
          title: const Text('Adopt Pussies'),
          actions: const [
            IconButton(onPressed: null, icon: Icon(Icons.search))
          ]),
      body: Padding(
        padding: EdgeInsets.all(30),
        child: ListView(
          children: const [Text('Pussy 1'), Text('Pussy 2'), Text('Pussy 3')],
        ),
      ),
    );
  }
}
