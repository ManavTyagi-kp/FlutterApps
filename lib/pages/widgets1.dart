import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({required this.title, super.key});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(color: Color.fromARGB(137, 36, 53, 207)),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.menu),
            tooltip: 'Navigation Menu',
          ),
          Expanded(
            child: title,
          ),
          const IconButton(
            onPressed: null,
            icon: Icon(Icons.search),
            tooltip: 'Search',
          )
        ],
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(children: [
        MyWidget(
          title: Text(
            'Learning Widgets',
            style: Theme.of(context).primaryTextTheme.titleLarge,
          ),
        ),
        const Expanded(
            child: Center(
          child: Text('Hello, world!'),
        ))
      ]),
    );
  }
}
