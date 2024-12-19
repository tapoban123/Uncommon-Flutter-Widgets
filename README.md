# Useful Flutter Widgets

### Solutions to the errors I faced in this project:
- Use the following command to change the gradle version of your project.
 [View Source](https://docs.gradle.org/current/userguide/gradle_wrapper.html#sec:upgrading_wrapper) <br>
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
4. [Isolates](#isolates)
5. [Search Delegate](#search-delegate)


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
    A material stepper widget that displays progress through a sequence of steps.

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
<a name="isolates"></a>
- ### Isolates ([View Code](lib/widgets/isolates_tutorial.dart))
    All Dart code runs in isolates, which are similar to threads, but differ in that isolates have their own isolated memory. They do not share state in any way, and can only communicate by messaging.

    _Example Code:_
    ```dart
    final receivePort = ReceivePort();

    // Spawn means creating a new instance.
    // We use await here to create the isolate, not to get the response.
    await Isolate.spawn(complexTask, receivePort.sendPort);

    receivePort.listen(
      (value) {
        // Perform tasks with the value received from the Isolate.
      },
    );

    void complexTask2(SendPort sendPort) {
      // Perform a complex task
    
      sendPort.send(result_of_complex_task);
    }
    ```
<a name="search-delegate"></a>
- ### Search Delegate ([View Code](lib/widgets/search_delegate_demo.dart))
    Shows a full screen search page and returns the search result selected by the user when the page is closed.

    _Example Code:_
    ```dart
      class CustomSearchDelegate extends SearchDelegate {
      final List<String> searchTerms = [
        // searchItems
      ];

      @override
      Widget? buildLeading(BuildContext context) {
        return IconButton(
          onPressed: () {
            close(context, null);
          },
          icon: const Icon(Icons.arrow_back),
        );
      }

      @override
      List<Widget>? buildActions(BuildContext context) {
        return [
          IconButton(
            onPressed: () {
              query = "";
            },
            icon: const Icon(Icons.clear),
          ),
        ];
      }


      @override
      Widget buildResults(BuildContext context) {
        final List<String> matchQuery = [];

        for (var fruit in searchTerms) {
          if (fruit.toLowerCase().contains(query.toLowerCase())) {
            matchQuery.add(fruit);
          }
        }

        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            final result = matchQuery[index];

            return ListTile(
              title: Text(
                result,
                style: const TextStyle(color: Colors.black),
              ),
            );
          },
        );
      }

      @override
      Widget buildSuggestions(BuildContext context) {
        List<String> matchQuery = [];

        for (var fruit in searchTerms) {
          if (fruit.toLowerCase().contains(query.toLowerCase())) {
            matchQuery.add(fruit);
          }
        }
        return ListView.builder(
          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            final fruit = matchQuery[index];
            return ListTile(
              title: Text(fruit),
            );
          },
        );
      }
    }

    ```