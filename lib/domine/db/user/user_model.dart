import 'package:hive/hive.dart';
part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel {
  UserModel({required this.name, required this.lastName, required this.email});

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;
}
