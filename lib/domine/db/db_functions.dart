import 'package:edeya_weather_app/domine/db/weather/weather_model.dart';
import 'package:hive_flutter/adapters.dart';

import 'user/user_model.dart';

const String boxName = 'users';
const String weatherBoxName = 'weather';
late Box<UserModel> userBox;
late Box<WeatherModel> weatherBox;

class UserBox {
  static Box<UserModel>? _box;
  static Box<WeatherModel>? _weatherBox;

  static Box<UserModel> getInstance() {
    return _box ??= Hive.box(boxName);
  }

  static Box<WeatherModel> getInstanceWeather() {
    return _weatherBox ??= Hive.box(weatherBoxName);
  }
}
