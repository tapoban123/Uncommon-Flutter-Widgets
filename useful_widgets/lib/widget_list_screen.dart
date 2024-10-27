import 'package:flutter/material.dart';
import 'package:useful_widgets/widget_button.dart';
import 'package:useful_widgets/widgets/fractionally_sized_box.dart';
import 'package:useful_widgets/widgets/hero_widget_demo.dart';
import 'package:useful_widgets/widgets/value_listenable_builder_demo.dart';

class WidgetListScreen extends StatelessWidget {
  const WidgetListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets List Screen"),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: ListView(
            children: const [
              WidgetButton(
                buttonText: "Hero Widget Demo",
                navigateToPage: HeroWidgetDemo(),
              ),
              WidgetButton(
                buttonText: "Fractionally Sized Box Widget Demo",
                navigateToPage: FractionallySizedBoxDemo(),
              ),
              WidgetButton(
                buttonText: "Value Listenable Builder Demo",
                navigateToPage: ValueListenableBuilderDemo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
