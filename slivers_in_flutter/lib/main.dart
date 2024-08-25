import 'package:flutter/material.dart';
import 'package:slivers_in_flutter/pages/slivers_demo_page.dart';

void main() {
  runApp(const FlutterSlivers());
}

class FlutterSlivers extends StatelessWidget {
  const FlutterSlivers({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Slivers Demo",
      home: SliversDemoPage(),
    );
  }
}