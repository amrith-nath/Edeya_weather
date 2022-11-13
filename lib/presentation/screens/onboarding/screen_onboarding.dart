import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../domine/onboarding/onboarding_model.dart';
import '../../../domine/onboarding/onboarding_notifier.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/size/size.dart';

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
        body: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: SizedBox(
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    onboardingTabs[index].title,
                                    style: GoogleFont.onboardTitleStyle,
                                  ),
                                  kHeight15,
                                  Text(
                                    onboardingTabs[index].subtitle,
                                    style: GoogleFont.onboardSubTitleStyle,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    onboardLoginButton(),
                    ValueListenableBuilder<int>(
                      valueListenable: onBoardingNotifier,
                      builder:
                          (BuildContext context, int index, Widget? child) {
                        log(onBoardingNotifier.value.toString());
                        return pageIndicaterWidget(
                          value: onBoardingNotifier.value + 1,
                        );
                      },
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

  Widget pageIndicaterWidget({required int value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: <Widget>[
          indicatorButton(label: 1, index: value),
          const Spacer(),
          Row(
            children: <Widget>[
              indicatorButton(label: 2, index: value),
            ],
          ),
          const Spacer(),
          indicatorButton(label: 3, index: value),
        ],
      ),
    );
  }

  ElevatedButton onboardLoginButton() {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: kBlue,
        elevation: 0,
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.person,
        size: 20,
        color: kBlack,
      ),
      label: const Text(
        'Skip to Login',
        style: TextStyle(
          color: kBlack,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  TextButton indicatorButton({required int label, required int index}) {
    final bool isSelected = label == index;

    return TextButton.icon(
      style: TextButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
      onPressed: () {},
      icon: Icon(
        Icons.circle,
        size: 5,
        color: isSelected ? kBlack : kGrey,
      ),
      label: Text(
        '0$label',
        style: TextStyle(
          color: isSelected ? kBlack : kGrey,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
