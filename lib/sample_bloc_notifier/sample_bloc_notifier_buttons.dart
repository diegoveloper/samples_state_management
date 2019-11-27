import 'package:flutter/material.dart';

import 'sample_bloc_notifier.dart';

class MyActionButtons extends StatelessWidget {
  final SampleNotifier notifier;

  const MyActionButtons({
    Key key,
    this.notifier,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: notifier.resetCounter,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: notifier.changeTheme,
        ),
      ],
    );
  }
}
