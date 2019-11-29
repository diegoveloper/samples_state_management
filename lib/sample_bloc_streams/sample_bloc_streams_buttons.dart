import 'package:flutter/material.dart';

import 'sample_bloc_streams.dart';

class MyActionButtons extends StatelessWidget {
  final SampleStreams sampleStreams;

  const MyActionButtons({
    Key key,
    this.sampleStreams,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: sampleStreams.resetCounter,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: sampleStreams.changeTheme,
        ),
      ],
    );
  }
}
