import 'dart:isolate';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool load = true;
  double result = 0.0;

  // Future<double> getVal() async{
  //   var value = 0.0;
  //   for(var i = 0; i < 1000000000; i++) {
  //     value += i;
  //   }
  //   return Future.value(value);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("This is a demo app")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // FutureBuilder(builder: (context, asyncsnapshot) => Text("Result: $value")),
            load ? const CircularProgressIndicator(): Text("Result: $result"),
            ElevatedButton(
              child: const Text("Load Heavy Task"),
              onPressed: () async {
                setState(() {
                  load = true;
                  //result = 0;
                });
                final receivePort = ReceivePort();
                await Isolate.spawn(complexTask, receivePort.sendPort);
                receivePort.listen((total) {
                  setState(() {
                    load = true;
                  });
                  debugPrint('Result: $total');
                  setState(() {
                    try{
                    result = total;
                    load = false;
                    } catch (e){
                      debugPrint('Failed $e');
                      return;
                    }
                  });
                });
              },
            ),
            ElevatedButton(
              child: const Text("Load Heavy Task 2"),
              onPressed: () async {
                setState(() {
                  load = true;
                  //result = 0;
                });
                var value = await complexTask2();
                debugPrint('$value');
                setState(() {
                  load = false;
                  result = value;
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  // useIsolate(SendPort sendPort) async {
  //   setState(() {
  //     load = true;
  //   });

  //   final ReceivePort receivePort = ReceivePort();
  //   try {
  //     await complexTask(sendPort);
  //     // wait Isolate.spawn(runHeavyTaskwithIsolate, [receivePort.sendPort, 40000000000]);
  //   } catch (e) {
  //     debugPrint('Isolate Failed: $e');
  //     receivePort.close();
  //     return;
  //   }

  //   await for (final message in receivePort) {
  //     if (message is int) {
  //       debugPrint('result: $message');
  //       setState(() {
  //         load = false;
  //         //result = message;
  //       });
  //       break;
  //     }
  //   }
  // }

  // void runHeavyTaskwithIsolate(List<dynamic> args) {
  //   SendPort port = args[0];
  //   int value = 0;
  //   for (var i = 0; i < args[1]; i++) {
  //     value += 1;
  //   }
  //   print('value $value');
  //   port.send(value);
  //   port.send(null); // Send a null message to indicate completion
  // }
}


complexTask(SendPort sendPort){
  var total = 0.0;
  for(var i = 0; i < 1000000000; i++) {
    total += i;
  }
  sendPort.send(total);
}

double callComplex() {
  var total = 0.0;
  for(var i = 0; i < 1000000000; i++) {
    total += i;
  }
  return total;
}

Future<double> complexTask2() {
  var total = 0.0;
  for(var i = 0; i < 1000000000; i++) {
    total += i;
  }
  
  return Future.value(total);
}