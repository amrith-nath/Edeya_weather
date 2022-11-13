import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/size/size.dart';
import '../../core/svgs/svgs.dart';
import '../onboarding/onboarding.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    log('splash builded');
    Future<void> startNavigate() async {
      await Future<void>.delayed(const Duration(seconds: 6));
      log('Navigate to Onboarding Screen');
      // ignore: use_build_context_synchronously
      await Navigator.pushReplacement(
        context,
        PageTransition<ScreenOnboarding>(
          child: const ScreenOnboarding(),
          type: PageTransitionType.rightToLeftWithFade,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
        ),
      );
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      startNavigate();
    });

    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Align(
              child: FadeInUp(
                key: const Key('mainText'),
                duration: const Duration(milliseconds: 700),
                child: SizedBox(
                  width: 200,
                  child: TextLiquidFill(
                    waveDuration: const Duration(seconds: 1),
                    text: 'Edeya',
                    boxBackgroundColor: kWhite,
                    waveColor: kGreen,
                    textStyle: GoogleFont.splashStyle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 70,
              child: FadeInUp(
                  key: const Key('subText'),
                  duration: const Duration(milliseconds: 900),
                  delay: const Duration(seconds: 4),
                  from: 1,
                  child: SizedBox(
                    width: size.width,
                    height: 60,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SvgPicture.asset(
                            splashSvg,
                            width: 25,
                            height: 25,
                            color: kgreytextColor,
                          ),
                          kwidth5,
                          Text(
                            'Weather',
                            style: GoogleFont.splashThinStyle,
                          ),
                        ],
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}