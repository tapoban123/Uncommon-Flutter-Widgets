import 'package:flutter/material.dart';
import 'package:useful_widgets/widget_list_screen.dart';
import 'package:useful_widgets/widgets/hero_widget_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Useful Widgets",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: WidgetListScreen(),
    );
  }
}
