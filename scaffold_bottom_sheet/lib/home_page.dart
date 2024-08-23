import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_bottom_sheet/bottom_sheet/show_bottom_sheet.dart';
import 'package:scaffold_bottom_sheet/providers/button_click_action_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ButtonClickActionProvider>(
        builder: (context, provider, child) {
          return SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    displayBottomSheet(context);
                  },
                  child: const Text("Open Bottom Sheet"),
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(provider.buttonOneClickedText),
                const SizedBox(
                  height: 10,
                ),
                Text(provider.buttonTwoClickedText),
                const SizedBox(
                  height: 15,
                ),
                if (provider.buttonOneClickedText.isNotEmpty ||
                    provider.buttonTwoClickedText.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      Provider.of<ButtonClickActionProvider>(
                        context,
                        listen: false,
                      ).resetTexts();
                    },
                    child: const Text("Reset"),
                  )
              ],
            ),
          );
        },
      ),
    );
  }
}
