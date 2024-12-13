import 'package:flutter/material.dart';

class RangeSliderDemo extends StatefulWidget {
  const RangeSliderDemo({super.key});

  @override
  State<RangeSliderDemo> createState() => _RangeSliderDemoState();
}

class _RangeSliderDemoState extends State<RangeSliderDemo> {
  RangeValues values = const RangeValues(0.1, 1.0);

  @override
  Widget build(BuildContext context) {
    RangeLabels rangeLabels = RangeLabels(
      values.start.toString(),
      values.end.toString(),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Range Slider Demo"),
      ),
      body: Center(
        child: RangeSlider(
          values: values,
          labels: rangeLabels,
          onChanged: (newRangeValues) {
            setState(() {
              values = newRangeValues;
            });
          },
          max: 1.0,
          min: 0.1,
        ),
      ),
    );
  }
}
