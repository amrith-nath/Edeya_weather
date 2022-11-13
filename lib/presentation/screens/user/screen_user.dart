import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class ScreenUser extends StatelessWidget {
  const ScreenUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: kBlack,
            ),
            label: const Text('Add User'),
          )
        ],
      ),
    );
  }
}
