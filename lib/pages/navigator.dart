import 'package:flutter/material.dart';

class MyNavPage extends StatefulWidget {
  // This class is the configuration for the state.
  // It holds the values (in this case nothing) provided
  // by the parent and used by the build  method of the
  // State. Fields in a Widget subclass are always marked
  // "final".

  const MyNavPage({super.key});

  @override
  State<MyNavPage> createState() => _MyNavPage();
}

class _MyNavPage extends State<MyNavPage> {
  var count = 0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: const Text('Example title'),
        actions: const [
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      body: Container(
        height: 100,
        //decoration: const BoxDecoration(color: Colors.blue),
        padding: const EdgeInsets.all(0),
        child: Row(
          children: [
            Container(
              height: 80,
              width: width / 4,
              padding: const EdgeInsets.all(5),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(188, 76, 175, 79)),
              child: const Expanded(child: Center(child: Text('Image here'))),
            ),
            Container(
              height: 80,
              width: width / 4,
              padding: const EdgeInsets.all(5),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(186, 76, 175, 79)),
              child: const Center(child: Text('Image here')),
            ),
            Container(
              height: 80,
              width: width / 4,
              padding: const EdgeInsets.all(5),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(188, 76, 175, 79)),
              child: const Center(child: Text('Image here')),
            ),
            Container(
              height: 80,
              width: width / 4,
              padding: const EdgeInsets.all(5),
              decoration:
                  const BoxDecoration(color: Color.fromARGB(188, 76, 175, 79)),
              child: const Center(
                child: Text(
                  'Image here',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'Flutter Tutorial',
    home: MyNavPage(),
  ));
}
