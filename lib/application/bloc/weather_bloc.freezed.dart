// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'weather_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeatherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWeatherReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWeatherReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWeatherReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWeatherReport value) getWeatherReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWeatherReport value)? getWeatherReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWeatherReport value)? getWeatherReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherEventCopyWith<$Res> {
  factory $WeatherEventCopyWith(
          WeatherEvent value, $Res Function(WeatherEvent) then) =
      _$WeatherEventCopyWithImpl<$Res, WeatherEvent>;
}

/// @nodoc
class _$WeatherEventCopyWithImpl<$Res, $Val extends WeatherEvent>
    implements $WeatherEventCopyWith<$Res> {
  _$WeatherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_GetWeatherReportCopyWith<$Res> {
  factory _$$_GetWeatherReportCopyWith(
          _$_GetWeatherReport value, $Res Function(_$_GetWeatherReport) then) =
      __$$_GetWeatherReportCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_GetWeatherReportCopyWithImpl<$Res>
    extends _$WeatherEventCopyWithImpl<$Res, _$_GetWeatherReport>
    implements _$$_GetWeatherReportCopyWith<$Res> {
  __$$_GetWeatherReportCopyWithImpl(
      _$_GetWeatherReport _value, $Res Function(_$_GetWeatherReport) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_GetWeatherReport implements _GetWeatherReport {
  const _$_GetWeatherReport();

  @override
  String toString() {
    return 'WeatherEvent.getWeatherReport()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_GetWeatherReport);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() getWeatherReport,
  }) {
    return getWeatherReport();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? getWeatherReport,
  }) {
    return getWeatherReport?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? getWeatherReport,
    required TResult orElse(),
  }) {
    if (getWeatherReport != null) {
      return getWeatherReport();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetWeatherReport value) getWeatherReport,
  }) {
    return getWeatherReport(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetWeatherReport value)? getWeatherReport,
  }) {
    return getWeatherReport?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetWeatherReport value)? getWeatherReport,
    required TResult orElse(),
  }) {
    if (getWeatherReport != null) {
      return getWeatherReport(this);
    }
    return orElse();
  }
}

abstract class _GetWeatherReport implements WeatherEvent {
  const factory _GetWeatherReport() = _$_GetWeatherReport;
}

/// @nodoc
mixin _$WeatherState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isError => throw _privateConstructorUsedError;
  WeatherReport? get weatherReport => throw _privateConstructorUsedError;
  CurrentWeather? get currentWeather => throw _privateConstructorUsedError;
  WeatherInfo? get weatherInfo => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeatherStateCopyWith<WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeatherStateCopyWith<$Res> {
  factory $WeatherStateCopyWith(
          WeatherState value, $Res Function(WeatherState) then) =
      _$WeatherStateCopyWithImpl<$Res, WeatherState>;
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      WeatherReport? weatherReport,
      CurrentWeather? currentWeather,
      WeatherInfo? weatherInfo});

  $WeatherReportCopyWith<$Res>? get weatherReport;
  $CurrentWeatherCopyWith<$Res>? get currentWeather;
  $WeatherInfoCopyWith<$Res>? get weatherInfo;
}

/// @nodoc
class _$WeatherStateCopyWithImpl<$Res, $Val extends WeatherState>
    implements $WeatherStateCopyWith<$Res> {
  _$WeatherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? weatherReport = freezed,
    Object? currentWeather = freezed,
    Object? weatherInfo = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherReport: freezed == weatherReport
          ? _value.weatherReport
          : weatherReport // ignore: cast_nullable_to_non_nullable
              as WeatherReport?,
      currentWeather: freezed == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeather?,
      weatherInfo: freezed == weatherInfo
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as WeatherInfo?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherReportCopyWith<$Res>? get weatherReport {
    if (_value.weatherReport == null) {
      return null;
    }

    return $WeatherReportCopyWith<$Res>(_value.weatherReport!, (value) {
      return _then(_value.copyWith(weatherReport: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CurrentWeatherCopyWith<$Res>? get currentWeather {
    if (_value.currentWeather == null) {
      return null;
    }

    return $CurrentWeatherCopyWith<$Res>(_value.currentWeather!, (value) {
      return _then(_value.copyWith(currentWeather: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WeatherInfoCopyWith<$Res>? get weatherInfo {
    if (_value.weatherInfo == null) {
      return null;
    }

    return $WeatherInfoCopyWith<$Res>(_value.weatherInfo!, (value) {
      return _then(_value.copyWith(weatherInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_WeatherStateCopyWith<$Res>
    implements $WeatherStateCopyWith<$Res> {
  factory _$$_WeatherStateCopyWith(
          _$_WeatherState value, $Res Function(_$_WeatherState) then) =
      __$$_WeatherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      bool isError,
      WeatherReport? weatherReport,
      CurrentWeather? currentWeather,
      WeatherInfo? weatherInfo});

  @override
  $WeatherReportCopyWith<$Res>? get weatherReport;
  @override
  $CurrentWeatherCopyWith<$Res>? get currentWeather;
  @override
  $WeatherInfoCopyWith<$Res>? get weatherInfo;
}

/// @nodoc
class __$$_WeatherStateCopyWithImpl<$Res>
    extends _$WeatherStateCopyWithImpl<$Res, _$_WeatherState>
    implements _$$_WeatherStateCopyWith<$Res> {
  __$$_WeatherStateCopyWithImpl(
      _$_WeatherState _value, $Res Function(_$_WeatherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isError = null,
    Object? weatherReport = freezed,
    Object? currentWeather = freezed,
    Object? weatherInfo = freezed,
  }) {
    return _then(_$_WeatherState(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isError: null == isError
          ? _value.isError
          : isError // ignore: cast_nullable_to_non_nullable
              as bool,
      weatherReport: freezed == weatherReport
          ? _value.weatherReport
          : weatherReport // ignore: cast_nullable_to_non_nullable
              as WeatherReport?,
      currentWeather: freezed == currentWeather
          ? _value.currentWeather
          : currentWeather // ignore: cast_nullable_to_non_nullable
              as CurrentWeather?,
      weatherInfo: freezed == weatherInfo
          ? _value.weatherInfo
          : weatherInfo // ignore: cast_nullable_to_non_nullable
              as WeatherInfo?,
    ));
  }
}

/// @nodoc

class _$_WeatherState implements _WeatherState {
  const _$_WeatherState(
      {required this.isLoading,
      required this.isError,
      this.weatherReport,
      this.currentWeather,
      this.weatherInfo});

  @override
  final bool isLoading;
  @override
  final bool isError;
  @override
  final WeatherReport? weatherReport;
  @override
  final CurrentWeather? currentWeather;
  @override
  final WeatherInfo? weatherInfo;

  @override
  String toString() {
    return 'WeatherState(isLoading: $isLoading, isError: $isError, weatherReport: $weatherReport, currentWeather: $currentWeather, weatherInfo: $weatherInfo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WeatherState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isError, isError) || other.isError == isError) &&
            (identical(other.weatherReport, weatherReport) ||
                other.weatherReport == weatherReport) &&
            (identical(other.currentWeather, currentWeather) ||
                other.currentWeather == currentWeather) &&
            (identical(other.weatherInfo, weatherInfo) ||
                other.weatherInfo == weatherInfo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isError,
      weatherReport, currentWeather, weatherInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      __$$_WeatherStateCopyWithImpl<_$_WeatherState>(this, _$identity);
}

abstract class _WeatherState implements WeatherState {
  const factory _WeatherState(
      {required final bool isLoading,
      required final bool isError,
      final WeatherReport? weatherReport,
      final CurrentWeather? currentWeather,
      final WeatherInfo? weatherInfo}) = _$_WeatherState;

  @override
  bool get isLoading;
  @override
  bool get isError;
  @override
  WeatherReport? get weatherReport;
  @override
  CurrentWeather? get currentWeather;
  @override
  WeatherInfo? get weatherInfo;
  @override
  @JsonKey(ignore: true)
  _$$_WeatherStateCopyWith<_$_WeatherState> get copyWith =>
      throw _privateConstructorUsedError;
}
