import 'package:animate_do/animate_do.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/colors/colors.dart';
import '../constants/fonts/fonts.dart';

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  bool kSwitch = false;

  @override
  void initState() {
    startNavigate();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Center(
          child: SizedBox(
            // color: Colors.blue,
            height: 300,
            width: double.infinity,
            child: Stack(
              children: <Widget>[
                kSwitch
                    ? Align(
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
                      )
                    : const SizedBox(),
                kSwitch
                    ? Positioned(
                        bottom: 80,
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
                                    Text(
                                      'Weather',
                                      style: GoogleFont.splashThinStyle,
                                    ),
                                    SvgPicture.asset(
                                      'assets/svg/svgviewer-output.svg',
                                      color: Colors.amber,
                                    ),
                                  ],
                                ),
                              ),
                            )),
                      )
                    : const SizedBox(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> startNavigate() async {
    await Future<dynamic>.delayed(const Duration(seconds: 1));
    setState(() {
      kSwitch = true;
    });
  }
}
