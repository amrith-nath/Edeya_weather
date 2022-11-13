import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

import '../../../domine/onboarding/onboarding_model.dart';
import '../../../domine/onboarding/onboarding_notifier.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/size/size.dart';
import '../login/screen_login.dart';

class ScreenOnboarding extends StatelessWidget {
  const ScreenOnboarding({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final PageController pageController = PageController();

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              width: size.width,
              height: size.width,
              // color: Colors.amber,
              child: ValueListenableBuilder<int>(
                  valueListenable: onBoardingNotifier,
                  builder: (BuildContext context, int index, Widget? child) {
                    return SlideInUp(
                      key: Key('lottie$index'),
                      child: Lottie.asset(
                        onboardingTabs[onBoardingNotifier.value].lottie,
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
            ),
            SizedBox(
              width: size.width,
              height: size.width * 0.8,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(
                    child: PageView.builder(
                        controller: pageController,
                        itemCount: onboardingTabs.length,
                        onPageChanged: (int value) {
                          onBoardingNotifier.value = value;
                        },
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  onboardingTabs[index].title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFont.onboardTitleStyle,
                                ),
                                kHeight15,
                                Text(
                                  onboardingTabs[index].subtitle,
                                  textAlign: TextAlign.center,
                                  style: GoogleFont.onboardSubTitleStyle,
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  ValueListenableBuilder<int>(
                    valueListenable: onBoardingNotifier,
                    builder: (BuildContext context, int index, Widget? child) {
                      log(onBoardingNotifier.value.toString());
                      return pageIndicaterWidget(
                        value: onBoardingNotifier.value + 1,
                        controller: pageController,
                      );
                    },
                  ),
                  kHeight10,
                  kHeight10,
                  SizedBox(
                    width: 300,
                    height: 50,
                    child: onboardLoginButton(context: context),
                  ),
                  kHeight10,
                  kHeight10,
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget pageIndicaterWidget(
      {required int value, required PageController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          indicatorButton(label: 1, index: value, controller: controller),
          kwidth5,
          indicatorButton(label: 2, index: value, controller: controller),
          kwidth5,
          indicatorButton(label: 3, index: value, controller: controller),
        ],
      ),
    );
  }

  ElevatedButton onboardLoginButton({required BuildContext context}) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: kButtonColor,
        elevation: 0,
      ),
      onPressed: () {
        Navigator.of(context).pushReplacement(
          PageTransition<ScreenLogin>(
            child: ScreenLogin(),
            childCurrent: const ScreenOnboarding(),
            type: PageTransitionType.bottomToTopJoined,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeIn,
          ),
        );
      },
      child: const Text(
        'Skip to Login',
        style: TextStyle(
          color: kWhite,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  TextButton indicatorButton(
      {required int label,
      required int index,
      required PageController controller}) {
    final bool isSelected = label == index;

    return TextButton.icon(
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      onPressed: () {
        controller.animateToPage(
          label - 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
        );

        // onBoardingNotifier.notifyListeners();
      },
      icon: Icon(
        Icons.circle,
        size: 5,
        color: isSelected ? kBlack : kGrey.withOpacity(0.5),
      ),
      label: Text(
        '0$label',
        style: TextStyle(
          color: isSelected ? kBlack : kGrey.withOpacity(0.5),
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
