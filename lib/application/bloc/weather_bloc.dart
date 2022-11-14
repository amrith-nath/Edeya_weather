// ignore_for_file: always_specify_types, sort_constructors_first

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../domine/db/db_functions.dart';
import '../../domine/db/weather/weather_model.dart';
import '../../domine/weather/failures/weather_failures.dart';
import '../../domine/weather/model/weather_model.dart';
import '../../domine/weather/repo/i_weather_repo.dart';

part 'weather_event.dart';
part 'weather_state.dart';
part 'weather_bloc.freezed.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final IWetherRepo iWetherRepo;

  WeatherBloc(this.iWetherRepo) : super(WeatherState.initial()) {
    on<_GetWeatherReport>((event, emit) async {
      emit(
        state.copyWith(isLoading: true),
      );
      //----------
      final Either<WeatherFailures, WeatherReport> weatherReportOption =
          await iWetherRepo.getWeatherReport();

      log(weatherReportOption.toString());

      final WeatherState newState = weatherReportOption.fold(
          (failures) => state.copyWith(
                isLoading: false,
                isError: true,
              ), (weatherReport) {
        // saveToDb(weatherReport);

        return state.copyWith(
          isError: false,
          isLoading: false,
          weatherReport: weatherReport,
          currentWeather: weatherReport.currentWeather,
          weatherInfo: weatherReport.currentWeather!.weather![0],
        );
      });

      emit(newState);
//--------------
    });
  }
}
