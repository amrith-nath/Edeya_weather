import 'package:flutter/material.dart';

import '../../../domine/onboarding/onboarding_model.dart';
import '../../core/fonts/fonts.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                width: size.width,
                height: size.width,
                // color: Colors.grey,
                child: Column(
                  children: <Widget>[
                    Flexible(
                      child: PageView.builder(
                          itemCount: onboardingTabs.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  onboardingTabs[index].title,
                                  style: GoogleFont.onboardTitleStyle,
                                )
                              ],
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
