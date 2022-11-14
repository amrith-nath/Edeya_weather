import 'package:dartz/dartz.dart';

import '../failures/weather_failures.dart';
import '../model/weather_model.dart';

abstract class IWetherRepo {
  Future<Either<WeatherFailures, WeatherReport>> getWeatherReport();
}
