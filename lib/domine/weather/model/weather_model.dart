// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
part 'weather_model.freezed.dart';
part 'weather_model.g.dart';

@freezed
class WeatherReport with _$WeatherReport {
  const factory WeatherReport({
    required double? lat,
    required double? lon,
    required String? timezone,
  }) = _WeatherReport;

  factory WeatherReport.fromJson(Map<String, dynamic> json) =>
      _$WeatherReportFromJson(json);
}

@freezed
class CurrentWeather with _$CurrentWeather {
  const factory CurrentWeather({
    required int? dt,
    required double? temp,
    required int? humidity,
    required int? sunset,
    required int? sunrise,
    @JsonKey(name: 'wind_speed') required double? windSpeed,
    @JsonKey(name: 'weather') required List<WeatherInfo>? weather,
  }) = _CurrentWeather;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
}

@freezed
class WeatherInfo with _$WeatherInfo {
  const factory WeatherInfo({
    @JsonKey(name: 'id') required int? id,
    @JsonKey(name: 'main') required String? main,
    @JsonKey(name: 'description') required String? description,
    @JsonKey(name: 'icon') required String? icon,
  }) = _WeatherInfo;

  factory WeatherInfo.fromJson(Map<String, dynamic> json) =>
      _$WeatherInfoFromJson(json);
}
