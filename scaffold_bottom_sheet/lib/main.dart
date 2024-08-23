import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_bottom_sheet/home_page.dart';
import 'package:scaffold_bottom_sheet/providers/button_click_action_provider.dart';

void main() {
  runApp(const ScaffoldBottomSheetDemo());
}

class ScaffoldBottomSheetDemo extends StatelessWidget {
  const ScaffoldBottomSheetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ButtonClickActionProvider(),
      builder: (context, child) {
        return const MaterialApp(
          title: "Bottom Sheet Demo",
          debugShowCheckedModeBanner: false,
          home: HomePage(),
        );
      },
    );
  }
}
