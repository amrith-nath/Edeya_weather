import 'package:hive_flutter/adapters.dart';

import 'user/user_model.dart';

const String boxName = 'users';
late Box<UserModel> userBox;

class UserBox {
  static Box<UserModel>? _box;

  static Box<UserModel> getInstance() {
    return _box ??= Hive.box(boxName);
  }
}
