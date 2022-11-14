// ignore_for_file: always_specify_types

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../application/bloc/weather_bloc.dart';

import '../../../domine/db/db_functions.dart';
import '../../core/colors/colors.dart';
import '../../core/fonts/fonts.dart';
import '../../core/size/size.dart';
import '../login/screen_login.dart';

class ScreenWeather extends StatelessWidget {
  ScreenWeather({super.key, required this.isCelcious});

  final bool isCelcious;
  @override
  Widget build(BuildContext context) {
    final String unit = isCelcious ? '°C' : '°F';
    double temperature = 0;
    final weatherDb = UserBox.getInstanceWeather();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      BlocProvider.of<WeatherBloc>(context)
          .add(const WeatherEvent.getWeatherReport());
      var weather = weatherDb.get('weather');
      log(weather.toString());
    });

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
          TextButton.icon(
            label: Text(
              'SignOut',
              style: GoogleFont.userEmailStyle,
            ),
            icon: const Icon(
              Icons.logout,
              color: kButtonColor,
              size: 20,
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
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: <Widget>[
                  const Icon(Icons.location_city),
                  kwidth5,
                  BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (context, textState) {
                    return textState.isLoading
                        ? loadingWidget(size: 20)
                        : Text(
                            textState.weatherReport!.timezone.toString(),
                            style: GoogleFont.userNameStyle,
                          );
                  }),
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
                      child: BlocBuilder<WeatherBloc, WeatherState>(
                        builder: (context, tempState) {
                          if (isCelcious && !tempState.isLoading) {
                            final double f = double.parse(
                                tempState.currentWeather!.temp.toString());
                            temperature = (f - 32) * 5 / 9;
                          } else if (!tempState.isLoading) {
                            temperature = double.parse(
                                tempState.currentWeather!.temp.toString());
                          }

                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              (tempState.isLoading)
                                  ? loadingWidget(size: 30)
                                  : Text(
                                      '${temperature.toStringAsFixed(2)} $unit',
                                      textAlign: TextAlign.start,
                                      style: GoogleFont.weatherTextStyle,
                                    ),
                              tempState.isLoading
                                  ? loadingWidget(size: 10)
                                  : Text(
                                      tempState.weatherInfo!.main.toString(),
                                      textAlign: TextAlign.start,
                                      style: GoogleFont.weatherSubStyle,
                                    ),
                            ],
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BlocBuilder<WeatherBloc, WeatherState>(
                          builder: (context, disState) {
                            return disState.isLoading
                                ? loadingWidget(size: 5)
                                : Text(
                                    disState.weatherInfo!.description
                                        .toString(),
                                    style: GoogleFont.timeDateStyle,
                                  );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, windSstate) {
                return windSstate.isLoading
                    ? loadingWidget(size: 30)
                    : weathercard(
                        const Color(0xff4D7DF6),
                        'assets/lottie_json/weather/26494-windy-new-color.json',
                        windSstate.currentWeather!.windSpeed.toString(),
                        'Wind Speed',
                        '-km/h',
                      );
              },
            ),
            BlocBuilder<WeatherBloc, WeatherState>(
              builder: (context, humState) {
                return humState.isLoading
                    ? loadingWidget(size: 30)
                    : weathercard(
                        const Color(0xff272727),
                        'assets/lottie_json/weather/72236-humidly.json',
                        humState.currentWeather!.humidity.toString(),
                        'Humidity',
                        '-g.m-3',
                      );
              },
            ),
          ],
        ),
      ),
    );
  }

  SizedBox loadingWidget({required double size}) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: kWhite,
      ),
    );
  }

  Padding weathercard(
    Color color,
    String lottie,
    String title,
    String sub,
    String text,
  ) {
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
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        title,
                        textAlign: TextAlign.start,
                        style: GoogleFont.weatherTextStyle,
                      ),
                      kwidth5,
                      Text(
                        text,
                        style: GoogleFont.weatherSubStyle,
                      )
                    ],
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
        childCurrent: ScreenWeather(
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
