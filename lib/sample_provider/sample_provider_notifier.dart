import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_provider/provider_notifier.dart';
import 'package:samples_state_management/sample_provider/sample_default_buttons.dart';

class SampleProviderNotifier extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    final provNotif = Provider.of<ProviderNotifier>(context, listen: false);
    return Consumer<ProviderNotifier>(
      builder: (_, snapshot, __) => Theme(
        data: snapshot.isDark ? ThemeData.dark() : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Without packages"),
            actions: [
              MyActionButtons()
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                Consumer<ProviderNotifier>(
                  builder: (_, snapshot, __) => Text(
                    '${snapshot.counter}',
                    style: Theme.of(context).textTheme.display1,
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: snapshot.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
