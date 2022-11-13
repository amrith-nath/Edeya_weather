import 'package:flutter/material.dart';

import '../../core/colors/colors.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
            label: const Text(
              'Add User',
              style: TextStyle(
                color: kButtonColor,
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) => Card(
                      color: Colors.amber,
                      child: SizedBox(height: 30, child: ListTile()),
                    )),
          )
        ],
      ),
    );
  }
}
