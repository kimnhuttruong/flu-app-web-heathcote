import 'package:b13_flutter/data/remote/model/login_user.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'login_user_request.jser.dart';

class LoginUserRequest {
  @Alias('email', isNullable: false)
  String email;

  @Alias('password', isNullable: false)
  String password;

  LoginUserRequest({LoginUser user}) {
    this.email = user.email;
    this.password = user.password;
  }
}

@GenSerializer(nullableFields: true)
class LoginUserRequestSerializer extends Serializer<LoginUserRequest>
    with _$LoginUserRequestSerializer {}
