import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {
  const StepperDemo({super.key});

  @override
  State<StepperDemo> createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stepper Demo"),
      ),
      body: Center(
        child: Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 3) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepTapped: (value) {
            setState(() {
              _currentStep = value;
            });
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: Text("Step 1"),
              content: TextButton(
                onPressed: () {},
                child: Text("Go to another step"),
              ),
            ),
            Step(
              title: Text("Step 2"),
              content: TextButton(
                onPressed: () {},
                child: Text("Go to another step"),
              ),
            ),
            Step(
              title: Text("Step 3"),
              content: TextButton(
                onPressed: () {},
                child: Text("Go to another step"),
              ),
            ),
            Step(
              title: Text("Step 4"),
              content: TextButton(
                onPressed: () {},
                child: Text("Go to another step"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
