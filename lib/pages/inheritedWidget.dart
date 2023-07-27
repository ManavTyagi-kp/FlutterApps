import 'package:flutter/material.dart';

class InheritedExample extends InheritedWidget {
  final Color asset;
  // const MyWidget({super.key});
  const InheritedExample(
      {super.key, required this.asset, required Widget child})
      : super(child: child);

  static InheritedExample? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedExample>();
  }

  static InheritedExample of(BuildContext context) {
    final InheritedExample? result = maybeOf(context);
    assert(result != null, 'No image found');
    return result!;
  }

  @override
  bool updateShouldNotify(InheritedExample oldWidget) =>
      asset != oldWidget.asset;
}

class MyCallPage extends StatelessWidget {
  const MyCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: InheritedExample(
      asset: Colors.blue,
      child: Builder(builder: (BuildContext innerContext) {
        return Text(
          'Hey Color',
          style: TextStyle(color: InheritedExample.of(innerContext).asset),
        );
      }),
    ));
  }
}

// In this example, the context used is the one from the OtherCallPage widget,
// which is a parent of the InheritedExample widget, so this does not work,
// and will assert when InheritedExample.of is called.
class OtherCallPage extends StatelessWidget {
  const OtherCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InheritedExample(
        asset: Colors.green,
        child: Text(
          'Hello New Color',
          style: TextStyle(color: InheritedExample.of(context).asset),
        ),
      ),
    );
  }
}
