import 'package:flutter/material.dart';
import 'package:samples_state_management/sample_default/sample_default_buttons.dart';

class SampleDefault extends StatefulWidget {
  SampleDefault({
    Key key,
  }) : super(key: key);

  @override
  _SampleDefaultState createState() => _SampleDefaultState();
}

class _SampleDefaultState extends State<SampleDefault> {
  int counter = 0;
  bool isDark = false;

  void _incrementCounter() {
    setState(() {
      counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      counter = 0;
    });
  }

  void _changeTheme() {
    setState(() {
      isDark = !isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: isDark ? ThemeData.dark() : ThemeData.light(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Without packages"),
          actions: [
            MyActionButtons(
              onTapRestore: _resetCounter,
              onTapTheme: _changeTheme,
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
              Text(
                '$counter',
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
