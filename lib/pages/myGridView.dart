import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyGridView extends StatefulWidget {
  const MyGridView({super.key});

  @override
  State<MyGridView> createState() => _MyGridViewState();
}

class _MyGridViewState extends State<MyGridView> {
  final double containerWidth = 100.0;
  List<bool> shouldScale = List.generate(2000, (index) => false);
  int hoveredIndex = -1;
  bool hover = false;
  @override
  Widget build(BuildContext context) {
    print("MyGridView build");
    // int numberOfContainer = MediaQuery.of(context).size.width ~/ containerWidth;
    int numberOfContainer = 5;
    return NestedScrollView(
      scrollDirection: Axis.horizontal,
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const SliverAppBar(),
      ],
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: numberOfContainer,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0),
        itemCount: 2000,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {});
            },
            onHover: (value) {
              setState(() {
                shouldScale[index] = !shouldScale[index];
                // hover = true;
              });
            },
            child: ScalableContainer(
              containerSize: containerWidth,
              shouldScale: shouldScale[index],
            ),
          );
          // return Container(
          //   width: hover ? 200 : containerWidth,
          //   height: hover ? 200 : containerWidth,
          //   color: Colors.blue,
          //   child: InkWell(
          //       onTap: () {
          //         setState(() {
          //           hover = true;
          //         });
          //       },
          //       onHover: (value) {
          //         setState(() {
          //           hover = true;
          //         });
          //       },
          //       child: Center(
          //           child: Text(
          //         'Image ${index + 1} here',
          //         style: const TextStyle(color: Colors.white, fontSize: 12),
          //       ))),
          // );
          // return Container(
          //   width: containerWidth,
          //   height: containerWidth,
          //   color: Colors.blue,
          //   child: Center(
          //       child: Text(
          //     'Image ${index + 1} here',
          //     style: const TextStyle(color: Colors.white, fontSize: 12),
          //   )),

          // );
        },
      ),
    );
  }
}

class ScalableContainer extends StatelessWidget {
  const ScalableContainer(
      {required this.containerSize, required this.shouldScale});
  final double containerSize;
  final bool shouldScale;

  @override
  Widget build(BuildContext context) {
    debugPrint("ScalableContainer");
    return Transform.scale(
      scale: shouldScale ? 1.5 : 1.0,
      child: Container(
        width: containerSize,
        height: containerSize,
        color: Colors.blue,
        child: Center(
          child: Text(
            shouldScale ? 'Scaled' : 'Not Scaled',
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MyAppBar extends StatefulWidget {
  const MyAppBar({super.key});

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          onPressed: null,
          icon: Icon(Icons.menu),
          tooltip: 'Navigation Menu',
        ),
        title: const Text('Grid View'),
        actions: const [
          IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          )
        ],
      ),
      body: const MyGridView(),
    );
  }
}
