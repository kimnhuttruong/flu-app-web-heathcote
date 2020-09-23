// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LoginUserRequestSerializer
    implements Serializer<LoginUserRequest> {
  @override
  Map<String, dynamic> toMap(LoginUserRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'email', model.email);
    setMapValueIfNotNull(ret, 'password', model.password);
    return ret;
  }

  @override
  LoginUserRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = LoginUserRequest();
    obj.email = map['email'] as String ?? getJserDefault('email') ?? obj.email;
    obj.password =
        map['password'] as String ?? getJserDefault('password') ?? obj.password;
    return obj;
  }
}
