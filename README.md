# Useful Flutter Widgets

### Solutions to the errors I faced in this project:
- Use the following command to change the gradle version of your project.
<a href="https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:upgrading_wrapper" target="_blank">View Source</a> <br>
Remember to navigate  _android_ folder of your project before running the command. 
    ```powershell
    1. cd android
    2. gradlew wrapper --gradle-version latest
    OR,
    gradlew wrapper --gradle-version <SPECIFIED_VERSION>
    ```

## Content
1. [Fractionally SizedBox](#fractionally-sized-box)
2. [Sliver AppBar](#sliver-appbar)
3. [Stepper](#stepper)


## Widgets
<a name="fractionally-sized-box"></a>
- ### Fractionally SizedBox ([View Code](lib/widgets/fractionally_sized_box.dart)) 
    A widget that sizes its child to a fraction of the total available space.

    _Example Code:_
    ```dart
    FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        alignment: FractionalOffset.center,
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.blue,
              width: 4,
            ),
          ),
        ),
    );
    ```
<a name="sliver-appbar"></a>
-  ### Sliver AppBar ([View Code](lib/widgets/sliver_app_bar_demo.dart))
    A Material Design app bar that integrates with a CustomScrollView.
    An app bar consists of a toolbar and potentially other widgets, such as a TabBar and a FlexibleSpaceBar

    _Example Code:_
    ```dart
     SliverAppBar(
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
          );
    ```
<a name="stepper"></a>
- ### Stepper ([View Code](lib/widgets/stepper_demo.dart))
    A material stepper widget that displays progress through a sequence of steps

    _Example Code:_
    ```dart
    Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 3) {
              setState(() {
                _currentStep += 1;
              });
            }
          },
          onStepTapped: (value) {
            setState(() {
              _currentStep = value;
            });
          },
          onStepCancel: () {
            if (_currentStep != 0) {
              setState(() {
                _currentStep -= 1;
              });
            }
          },
          steps: [
            Step(
              title: const Text("Step 1"),
              content: TextButton(
                onPressed: () {},
                child: const Text("Go to another step"),
              ),
            ),
            Step(
              title: const Text("Step 2"),
              content: TextButton(
                onPressed: () {},
                child: const Text("Go to another step"),
              ),
            ),
          ],
        );
    ```