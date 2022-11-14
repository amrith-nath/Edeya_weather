import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'weather_model.g.dart';

@HiveType(typeId: 1)
class WeatherModel extends Equatable {
  const WeatherModel({
    required this.temp,
    required this.humidity,
    required this.windSpeed,
    required this.timezone,
    required this.weatherInfo,
    required this.weathermain,
    required this.icon,
  });

  @HiveField(0)
  final double temp;
  @HiveField(1)
  final int humidity;
  @HiveField(2)
  final double windSpeed;
  @HiveField(3)
  final String timezone;
  @HiveField(4)
  final String weatherInfo;
  @HiveField(5)
  final String icon;
  @HiveField(6)
  final String weathermain;

  @override
  // TODO: implement props
  List<Object?> get props => <Object>[
        temp,
        humidity,
        windSpeed,
        timezone,
        weatherInfo,
        icon,
        weathermain
      ];
}
