import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_failures.freezed.dart';
part 'weather_failures.g.dart';

@freezed
class WeatherFailures with _$WeatherFailures {
  const factory WeatherFailures.clientFailure() = ClientFailure;
  const factory WeatherFailures.serverFailure() = ServerFailure;

  factory WeatherFailures.fromJson(Map<String, dynamic> json) =>
      _$WeatherFailuresFromJson(json);
}
