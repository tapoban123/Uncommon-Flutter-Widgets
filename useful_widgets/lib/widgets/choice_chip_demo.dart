import 'package:flutter/material.dart';

class ChoiceChipDemo extends StatefulWidget {
  const ChoiceChipDemo({super.key});

  @override
  State<ChoiceChipDemo> createState() => _ChoiceChipDemoState();
}

class _ChoiceChipDemoState extends State<ChoiceChipDemo> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choice Chip Demo"),
      ),
      body: Center(
        child: ChoiceChip(
          label: const Text("I am a Choice Chip"),
          selected: _isSelected,
          onSelected: (value) {
            setState(() {
              _isSelected = value;
            });
          },
        ),
      ),
    );
  }
}
