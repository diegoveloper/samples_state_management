import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_bloc_streams/sample_streams.dart';

class MyActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: Provider.of<SampleStreams>(context, listen: false).resetCounter,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: Provider.of<SampleStreams>(context, listen: false).changeTheme,
        ),
      ],
    );
  }
}
