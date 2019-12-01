import 'dart:async';

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