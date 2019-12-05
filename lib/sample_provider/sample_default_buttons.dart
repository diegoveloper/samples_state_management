import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samples_state_management/sample_provider/provider_notifier.dart';

class MyActionButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provNotif = Provider.of<ProviderNotifier>(context, listen: false);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(Icons.restore),
          onPressed: provNotif.resetCounter,
        ),
        IconButton(
          icon: Icon(Icons.check),
          onPressed: provNotif.changeTheme,
        ),
      ],
    );
  }
}
