import 'dart:developer';
import 'dart:isolate';

import 'package:flutter/material.dart';

class IsolatesTutorial extends StatelessWidget {
  const IsolatesTutorial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Isolates Tutorial"),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 30,
          children: [
            Image.asset("assets/gifs/bouncing-ball.gif"),
            // Blocking UI task
            ElevatedButton(
              onPressed: () async {
                final complexTaskResult = await complexTask();
                log("Result 1: ${complexTaskResult.toString()}");
              },
              child: const Text("Task 1"),
            ),

            // Using Isolates
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();

                // Spawn means creating a new instance.
                // We use await here to create the isolate, not to get the response.
                await Isolate.spawn(complexTask2, receivePort.sendPort);

                receivePort.listen(
                  (total) {
                    log("Result 2: $total");
                  },
                );
              },
              child: const Text("Task 2"),
            ),
            // Passing data through isolates
            // Or, Passing parameters to isolates
            ElevatedButton(
              onPressed: () async {
                final receivePort = ReceivePort();

                await Isolate.spawn(
                    complexTask3,
                    Data(
                      iteration: 1000000000,
                      sendPort: receivePort.sendPort,
                    ));

                receivePort.listen(
                  (total) {
                    log("Result 3: $total");
                  },
                );
              },
              child: const Text("Task 3"),
            ),
          ],
        ),
      ),
    );
  }

  Future<double> complexTask() async {
    double sum = 0;

    for (int i = 0; i < 1000000000; i++) {
      sum += i;
    }
    return sum;
  }
}

/// Methods for isolates should be independent; that is, they must not be inside of any UI class.
void complexTask2(SendPort sendPort) {
  double sum = 0;

  for (int i = 0; i < 1000000000; i++) {
    sum += i;
  }
  sendPort.send(sum);
}

void complexTask3(Data data) {
  double sum = 0;

  for (int i = 0; i < data.iteration; i++) {
    sum += i;
  }
  data.sendPort.send(sum);
}

// -- POJO Class --
class Data {
  final int iteration;
  final SendPort sendPort;

  Data({
    required this.iteration,
    required this.sendPort,
  });
}
