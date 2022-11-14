import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/keys/navigator_key.dart';
import '../../core/size/size.dart';
import '../login/screen_login.dart';

class ScreenWeather extends StatelessWidget {
  const ScreenWeather({super.key, required this.isCelcious});

  final bool? isCelcious;

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {});

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: kButtonColor,
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          'Weather',
          style: GoogleFont.userNameStyle,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: kButtonColor,
              size: 25,
            ),
            onPressed: () async {
              final SharedPreferences preferences =
                  await SharedPreferences.getInstance();
              preferences.setBool('islogin', false);
              // ignore: use_build_context_synchronously
              navigateToLogin(context);
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                const Icon(Icons.location_city),
                kwidth5,
                Text(
                  'Location City name',
                  style: GoogleFont.userNameStyle,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: Container(
              color: kBlue,
              height: 200,
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Lottie.asset(
                          'assets/lottie_json/weather/4803-weather-storm.json',
                          width: 100),
                    ),
                  ),
                  Align(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '30°C',
                          textAlign: TextAlign.start,
                          style: GoogleFont.weatherTextStyle,
                        ),
                        Text(
                          'Weather Info',
                          textAlign: TextAlign.start,
                          style: GoogleFont.weatherSubStyle,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '13 DEC 2022',
                        style: GoogleFont.timeDateStyle,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '02:49 PM',
                        style: GoogleFont.timeDateStyle,
                      ),
                    ),
                  )
                ],
              ),
            )),
          ),
          weathercard(
            const Color(0xff4D7DF6),
            'assets/lottie_json/weather/26494-windy-new-color.json',
            '56 km/h',
            'Wind Speed',
          ),
          weathercard(
            const Color(0xff272727),
            'assets/lottie_json/weather/72236-humidly.json',
            '56 km/h',
            'Humidity',
          ),
        ],
      ),
    );
  }

  Padding weathercard(Color color, String lottie, String title, String sub) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Container(
          height: 150,
          color: color,
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(
                  lottie,
                  width: 100,
                ),
              ),
            ),
            Align(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    textAlign: TextAlign.start,
                    style: GoogleFont.weatherTextStyle,
                  ),
                  Text(
                    sub,
                    textAlign: TextAlign.start,
                    style: GoogleFont.weatherSubStyle,
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  void navigateToLogin(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).push(
      PageTransition<ScreenLogin>(
        child: ScreenLogin(),
        childCurrent: const ScreenWeather(
          isCelcious: true,
        ),
        type: PageTransitionType.rightToLeftJoined,
        reverseDuration: const Duration(milliseconds: 500),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeIn,
      ),
    );
  }
}
