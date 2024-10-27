import 'package:flutter/material.dart';

final ValueNotifier<int> count = ValueNotifier(0);

class ValueListenableBuilderDemo extends StatelessWidget {
  const ValueListenableBuilderDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Value Listenable Builder Widget Demo"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: count,
              builder: (context, value, child) => Text(
                value.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                count.value += 1;
              },
              child: const Text("+"),
            ),
          ],
        ),
      ),
    );
  }
}
