import 'package:flutter/material.dart';
import 'package:useful_widgets/widget_button.dart';
import 'package:useful_widgets/widgets/bottom_modal_sheet_demo.dart';
import 'package:useful_widgets/widgets/choice_chip_demo.dart';
import 'package:useful_widgets/widgets/dynamic_carousel_tutorial.dart';
import 'package:useful_widgets/widgets/fractionally_sized_box.dart';
import 'package:useful_widgets/widgets/hero_widget_demo.dart';
import 'package:useful_widgets/widgets/isolates_tutorial.dart';
import 'package:useful_widgets/widgets/range_slider_demo.dart';
import 'package:useful_widgets/widgets/search_delegate_demo.dart';
import 'package:useful_widgets/widgets/sliver_app_bar_demo.dart';
import 'package:useful_widgets/widgets/slivers_demo.dart';
import 'package:useful_widgets/widgets/stepper_demo.dart';
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
              WidgetButton(
                buttonText: "Stepper Demo",
                navigateToPage: StepperDemo(),
              ),
              WidgetButton(
                buttonText: "Search Delegate Demo",
                navigateToPage: SearchDelegateDemo(),
              ),
              WidgetButton(
                buttonText: "Choice Chip Demo",
                navigateToPage: ChoiceChipDemo(),
              ),
              WidgetButton(
                buttonText: "Sliver AppBar Demo",
                navigateToPage: SliverAppBarDemo(),
              ),
              WidgetButton(
                buttonText: "Range Slider Demo",
                navigateToPage: RangeSliderDemo(),
              ),
              WidgetButton(
                buttonText: "Slivers Demo",
                navigateToPage: SliversDemo(),
              ),
              WidgetButton(
                buttonText: "Modal Bottom Sheet Demo",
                navigateToPage: BottomModalSheetDemo(),
              ),
              WidgetButton(
                buttonText: "Carousel Slider Demo",
                navigateToPage: DynamicCarouselTutorial(),
              ),
              WidgetButton(
                buttonText: "Isolates Demo",
                navigateToPage: IsolatesTutorial(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
