import 'package:b13_flutter/data/models/user.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'auth_response.jser.dart';

class AuthResponse {
  @Alias('token', isNullable: false)
  String token;

  @Alias('expiredIn', isNullable: false)
  int expiresIn;

  @Alias('user', isNullable: false)
  User user;
}

@GenSerializer(nullableFields: true)
class AuthResponseSerializer extends Serializer<AuthResponse> with _$AuthResponseSerializer {}
