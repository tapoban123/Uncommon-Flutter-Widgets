import 'package:flutter/material.dart';

class FractionallySizedBoxDemo extends StatelessWidget {
  const FractionallySizedBoxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fractionally Sized Box Widget Demo"),
        centerTitle: true,
      ),
      body: Center(
        child: FractionallySizedBox(
          heightFactor: 0.5,
          widthFactor: 0.3,
          child: Container(
            color: Colors.green,
            child: const Text("50% height\n30% width"),
          ),
        ),
      ),
    );
  }
}
