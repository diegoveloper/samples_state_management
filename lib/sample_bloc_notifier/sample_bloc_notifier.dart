import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_bloc_notifier/sample_bloc_notifier_buttons.dart';
import 'package:samples_state_management/sample_bloc_notifier/sample_notifier.dart';

class SampleBLoCNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SampleNotifier>(
      builder: (_, state, __) => Theme(
        data: state.isDark ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("BLoC, Notifier & Provider"),
            actions: [
              MyActionButtons(),
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
                  '${state.counter}',
                  style: Theme.of(context).textTheme.display1,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: state.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
