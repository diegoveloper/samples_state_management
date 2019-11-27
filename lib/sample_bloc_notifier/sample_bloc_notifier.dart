import 'package:flutter/material.dart';
import 'package:samples_state_management/sample_bloc_notifier/sample_bloc_notifier_buttons.dart';

class SampleNotifier with ChangeNotifier {
  int counter = 0;
  bool isDark = false;

  void incrementCounter() {
    counter++;
    notifyListeners();
  }

  void resetCounter() {
    counter = 0;
    notifyListeners();
  }

  void changeTheme() {
    isDark = !isDark;
    notifyListeners();
  }
}

class SampleBLoCNotifier extends StatelessWidget {
  final notifier = SampleNotifier();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: notifier,
      builder: (_, __) => Theme(
        data: notifier.isDark ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("BLoC with Notifier"),
            actions: [
              MyActionButtons(
                notifier: notifier,
              ),
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${notifier.counter}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: notifier.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
