import 'package:flutter/material.dart';

class SliverAppBarDemo extends StatelessWidget {
  const SliverAppBarDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            pinned: false,
            floating: true,
            snap: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.none,
              title: Text("This is flexible space"),
              centerTitle: true,
            ),
            title:  Text("Sliver AppBar Demo"),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const Text(
                  "SLIVER",
                  style: TextStyle(fontSize: 600),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
