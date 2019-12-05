import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_bloc_notifier/sample_bloc_notifier.dart';
import 'package:samples_state_management/sample_default/sample_default.dart';
import 'package:samples_state_management/sample_provider/provider_notifier.dart';
import 'package:samples_state_management/sample_provider/sample_provider_notifier.dart';

import 'sample_bloc_streams/sample_bloc_streams.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  void _openPage(BuildContext context, Widget page) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => page,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("State Management Samples"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  onPressed: () => _openPage(context, SampleDefault()),
                  child: Text("Sample Default"),
                ),
                RaisedButton(
                  onPressed: () => _openPage(context, SampleBLoCNotifier()),
                  child: Text("Sample BLoC with Notifier"),
                ),
                RaisedButton(
                  onPressed: () => _openPage(context, SampleBLoCStreams()),
                  child: Text("Sample BLoC with Streams"),
                ),
                RaisedButton(
                  onPressed: () {
                    final page = SampleProviderNotifier();
                    _openPage(
                      context,
                      MultiProvider(
                        providers: [
                          ChangeNotifierProvider(create: (_) => ProviderNotifier()),
//                          StreamProvider(),
//                          ChangeNotifierProvider(create: (_) => ProviderNotifier()),
//                          ChangeNotifierProvider(create: (_) => ProviderNotifier()),
//                          ChangeNotifierProvider(create: (_) => ProviderNotifier()),
//                          ChangeNotifierProvider(create: (_) => ProviderNotifier()),
                        ],
                        child: MaterialApp(
                          home: page,
                        ),
                      ),
                    );
                  },
                  child: Text("Sample Provider Notifier"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
