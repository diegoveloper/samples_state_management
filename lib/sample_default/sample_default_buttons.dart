import 'package:flutter/material.dart';

class MyActionButtons extends StatelessWidget {
  final VoidCallback onTapRestore;
  final VoidCallback onTapTheme;

  const MyActionButtons({
    Key key,
    this.onTapRestore,
    this.onTapTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: onTapRestore,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: onTapTheme,
        ),
      ],
    );
  }
}
