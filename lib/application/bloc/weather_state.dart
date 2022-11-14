part of 'weather_bloc.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState({
    required bool isLoading,
    required bool isError,
    WeatherReport? weatherReport,
  }) = _WeatherState;

  factory WeatherState.initial() =>
      const WeatherState(isLoading: false, isError: false);
}
