import 'dart:developer';

import 'package:flutter/material.dart';

class ScreenWeather extends StatelessWidget {
  const ScreenWeather({super.key, required this.isCelcious});

  final bool? isCelcious;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (isCelcious!) {
        log("celcious");
      } else {
        log("faranheigt");
      }
    });

    return Scaffold(
      appBar: AppBar(),
    );
  }
}
