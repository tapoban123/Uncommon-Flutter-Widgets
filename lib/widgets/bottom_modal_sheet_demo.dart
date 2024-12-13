import 'package:flutter/material.dart';

class BottomModalSheetDemo extends StatefulWidget {
  const BottomModalSheetDemo({super.key});

  @override
  State<BottomModalSheetDemo> createState() => _BottomModalSheetDemoState();
}

class _BottomModalSheetDemoState extends State<BottomModalSheetDemo> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modal Bottom Sheet Demo"),
        actions: [
          IconButton(
            onPressed: () {
              _displayBottomSheet(context);
            },
            icon: const Text("Show Sheet"),
          ),
        ],
      ),
    );
  }

  void _displayBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 1.0,
        minChildSize: 0.3,
        expand: false,
        snap: true,
        builder: (context, scrollController) {
          return _bottomSheetContent(scrollController: _scrollController);
        },
      ),
    );
  }

  Widget _bottomSheetContent({required ScrollController scrollController}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          width: 100,
          height: 5,
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            color: Colors.black.withValues(alpha: 0.4),
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
                    // Provider.of<ButtonClickActionProvider>(
                    //   context,
                    //   listen: false,
                    // ).buttonOneClicked();
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.ads_click_rounded),
                  title: const Text("Button 2"),
                  onTap: () {
                    // Provider.of<ButtonClickActionProvider>(
                    //   context,
                    //   listen: false,
                    // ).buttonTwoClicked();
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
