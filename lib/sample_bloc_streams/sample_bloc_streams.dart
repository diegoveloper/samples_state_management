import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_bloc_streams/sample_bloc_streams_buttons.dart';
import 'package:samples_state_management/sample_bloc_streams/sample_streams.dart';

class SampleBLoCStreams extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SampleStreams>(
      builder: (_, state, __) => StreamBuilder<bool>(
        stream: state.streamTheme,
        initialData: false,
        builder: (context, snapshot) => Theme(
          data: snapshot.hasData && snapshot.data
              ? ThemeData.dark()
              : ThemeData.light(),
          child: Scaffold(
            appBar: AppBar(
              title: Text("BLoc, Streams & Provider"),
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
                  StreamBuilder<int>(
                    stream: state.streamCounter,
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
              onPressed: state.incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
