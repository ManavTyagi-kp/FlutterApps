import 'dart:math';

import 'package:flutter/material.dart';

class MyKeyPage extends StatefulWidget {
  // const MyKeyPage({super.key});

  @override
  State<MyKeyPage> createState() => _MyKeyPageState();
}

class _MyKeyPageState extends State<MyKeyPage> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    tiles = [
      StatefulColorfulTiles(
        key: UniqueKey(),
      ),
      StatefulColorfulTiles(
        key: UniqueKey(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: 'Navigation Menu',
        ),
        title: const Expanded(child: Text('Testing keys')),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          ),
        ],
      ),
      body: SafeArea(child: Row(children: tiles)),
      floatingActionButton: FloatingActionButton(
        onPressed: swapTiles,
        hoverColor: Colors.blue,
        backgroundColor: Colors.amber,
        splashColor: Color.fromARGB(255, 131, 183, 226),
        child: const Icon(Icons.swap_horiz),
      ),
    );
  }

  swapTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
}

class StatelessColorfulTiles extends StatelessWidget {
  final Color mycolor = UniqueColorGenerator.getColor();

  StatelessColorfulTiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      width: 100,
      color: mycolor,
    );
  }
}

class StatefulColorfulTiles extends StatefulWidget {
  const StatefulColorfulTiles({super.key});

  @override
  State<StatefulColorfulTiles> createState() => _StatefulColorfulTilesState();
}

class _StatefulColorfulTilesState extends State<StatefulColorfulTiles> {
  Color mycolor = UniqueColorGenerator.getColor();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      height: 100,
      width: 100,
      color: mycolor,
    );
  }
}

class UniqueColorGenerator {
  static List colorOptions = [
    Colors.blue,
    Colors.red,
    Colors.green,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.indigo,
    Colors.amber,
    Colors.black
  ];
  static Random random = new Random();
  static Color getColor() {
    if (colorOptions.isNotEmpty) {
      return colorOptions.removeAt(random.nextInt(colorOptions.length));
    } else {
      return Color.fromARGB(random.nextInt(256), random.nextInt(256),
          random.nextInt(256), random.nextInt(256));
    }
  }
}
