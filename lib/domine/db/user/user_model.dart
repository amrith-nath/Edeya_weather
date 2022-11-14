// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends Equatable {
  const UserModel({
    required this.name,
    required this.lastName,
    required this.email,
    this.isCelcious = false,
  });

  @HiveField(0)
  final String name;
  @HiveField(1)
  final String lastName;
  @HiveField(2)
  final String email;

  @HiveField(3)
  final bool isCelcious;

  UserModel copyWith({
    String? name,
    String? lastName,
    String? email,
    bool? isCelcious,
  }) {
    return UserModel(
      name: name ?? this.name,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      isCelcious: isCelcious ?? this.isCelcious,
    );
  }

  @override
  List<Object> get props => <Object>[name, lastName, email, isCelcious];
}
