import 'dart:async';

import 'package:flutter/material.dart';
import 'package:samples_state_management/sample_bloc_streams/sample_bloc_streams_buttons.dart';

class SampleStreams {
  final _controllerCounter = StreamController<int>();
  final _controllerTheme = StreamController<bool>();

  Stream<bool> get streamTheme => _controllerTheme.stream;
  Stream<int> get streamCounter => _controllerCounter.stream;

  int _counter = 0;
  bool _isDark = false;

  void incrementCounter() {
    _counter++;
    _controllerCounter.add(_counter);
  }

  void resetCounter() {
    _counter = 0;
    _controllerCounter.add(_counter);
  }

  void changeTheme() {
    _isDark = !_isDark;
    _controllerTheme.add(_isDark);
  }
}

class SampleBLoCStreams extends StatelessWidget {
  final streamsBLoC = SampleStreams();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: streamsBLoC.streamTheme,
      initialData: false,
      builder: (context, snapshot) => Theme(
        data: snapshot.hasData && snapshot.data
            ? ThemeData.dark()
            : ThemeData.light(),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Without packages"),
            actions: [
              MyActionButtons(
                sampleStreams: streamsBLoC,
              )
            ],
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'You have pushed the button this many times:',
                ),
                StreamBuilder<int>(
                  stream: streamsBLoC.streamCounter,
                  initialData: 0,
                  builder: (context, snapshot) {
                    return Text(
                      "${snapshot.data}",
                      style: Theme.of(context).textTheme.display1,
                    );
                  },
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: streamsBLoC.incrementCounter,
            tooltip: 'Increment',
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}
