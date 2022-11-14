// ignore_for_file: always_specify_types

import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../domine/db/db_functions.dart';
import '../../domine/db/weather/weather_model.dart';
import '../../domine/weather/failures/weather_failures.dart';
import '../../domine/weather/model/weather_model.dart';
import '../../domine/weather/repo/i_weather_repo.dart';
import '../api.dart';

@LazySingleton(as: IWetherRepo)
class WeatherRepository implements IWetherRepo {
  final box = UserBox.getInstanceWeather();

  @override
  Future<Either<WeatherFailures, WeatherReport>> getWeatherReport() async {
    try {
      // ignore: strict_raw_type
      final Response response = await Dio(BaseOptions()).get(api);
      if (response.statusCode == 200 || response.statusCode == 201) {
        log('response gotcha');
        final WeatherReport report =
            WeatherReport.fromJson(response.data as Map<String, dynamic>);
        saveToDb(report);
        return Right(report);
      } else {
        return const Left(WeatherFailures.serverFailure());
      }
    } catch (_) {
      return const Left(WeatherFailures.clientFailure());
    }
  }

  saveToDb(WeatherReport report) async {
    await box.put(
      'weather',
      WeatherModel(
        temp: double.parse(report.currentWeather!.temp.toString()),
        humidity: int.parse(report.currentWeather!.humidity.toString()),
        windSpeed: double.parse(report.currentWeather!.temp.toString()),
        timezone: report.timezone.toString(),
        weatherInfo: '${report.currentWeather!.weather![0].description}',
        weathermain: '${report.currentWeather!.weather![0].main}',
        icon: '${report.currentWeather!.weather![0].icon}',
      ),
    );
  }
}
