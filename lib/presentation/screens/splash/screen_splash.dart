import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/size/size.dart';
import '../../core/svgs/svgs.dart';
import '../home/screen_home.dart';
import '../onboarding/screen_onboarding.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startNavigate(context);
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
                    waveColor: kButtonColor,
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

  Future<void> startNavigate(BuildContext context) async {
    await Future<void>.delayed(const Duration(seconds: 6));
    log('Navigate to Onboarding Screen');
    final bool loginState = await loginCheck();
    if (!loginState) {
      // ignore: use_build_context_synchronously
      navigate(context, const ScreenOnboarding());
    } else {
      // ignore: use_build_context_synchronously
      navigate(context, const ScreenHome());
    }
  }

  void navigate(BuildContext context, Widget screen) {
    Navigator.pushReplacement(
      context,
      // ignore: always_specify_types
      PageTransition(
        child: screen,
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(seconds: 1),
        curve: Curves.easeIn,
      ),
    );
  }

  Future<bool> loginCheck() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final bool? isLogin = preferences.getBool('islogin');
    if (isLogin == null || isLogin == false) {
      return false;
    } else {
      return true;
    }
  }
}
