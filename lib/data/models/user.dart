import 'package:b13_flutter/data/models/location.dart';
import 'package:equatable/equatable.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user.jser.dart';

class User extends Equatable {
  @Alias('_id', isNullable: false)
  final String id;

  @Alias('email', isNullable: false)
  final String email;

  @Alias('role', isNullable: false)
  final int role;

  @Alias('firstName', isNullable: false)
  final String firstName;

  @Alias('surName', isNullable: false)
  final String surName;

  @Alias('mobileTel', isNullable: false)
  final String mobileTel;

  @Alias('title', isNullable: false)
  final String title;

  @Alias('sex', isNullable: false)
  final String sex;

  Location location;

  User({
    this.id,
    this.email,
    this.role,
    this.firstName,
    this.surName,
    this.mobileTel,
    this.title,
    this.sex,
    this.location,
  });

  @override
  List<Object> get props => [
        id,
        email,
        role,
        firstName,
        surName,
        mobileTel,
        title,
        sex,
      ];
}

@GenSerializer(nullableFields: true)
class UserSerializer extends Serializer<User> with _$UserSerializer {}
