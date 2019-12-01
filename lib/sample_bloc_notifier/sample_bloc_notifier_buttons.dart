import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_bloc_notifier/sample_notifier.dart';

class MyActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: Provider.of<SampleNotifier>(context,listen: false).resetCounter,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: Provider.of<SampleNotifier>(context,listen: false).changeTheme,
        ),
      ],
    );
  }
}
