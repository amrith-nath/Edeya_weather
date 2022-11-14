// ignore_for_file: always_specify_types

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../domine/weather/failures/weather_failures.dart';
import '../../domine/weather/model/weather_model.dart';
import '../../domine/weather/repo/i_weather_repo.dart';
import '../api.dart';

@LazySingleton(as: IWetherRepo)
class WeatherRepository implements IWetherRepo {
  @override
  Future<Either<WeatherFailures, WeatherReport>> getWeatherReport() async {
    try {
      // ignore: strict_raw_type
      final Response response = await Dio(BaseOptions()).get(api);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final WeatherReport report =
            WeatherReport.fromJson(response.data as Map<String, dynamic>);
        return Right(report);
      } else {
        return const Left(WeatherFailures.serverFailure());
      }
    } catch (_) {
      return const Left(WeatherFailures.clientFailure());
    }
  }
}
