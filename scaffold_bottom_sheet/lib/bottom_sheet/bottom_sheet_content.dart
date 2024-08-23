import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaffold_bottom_sheet/providers/button_click_action_provider.dart';

class BottomSheetContent extends StatelessWidget {
  final ScrollController scrollController;
  const BottomSheetContent({
    super.key,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 100,
          height: 5,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.4),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.ads_click),
                  title: const Text("Button 1"),
                  onTap: () {
                    Provider.of<ButtonClickActionProvider>(
                      context,
                      listen: false,
                    ).buttonOneClicked();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.ads_click_rounded),
                  title: const Text("Button 2"),
                  onTap: () {
                    Provider.of<ButtonClickActionProvider>(
                      context,
                      listen: false,
                    ).buttonTwoClicked();
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
