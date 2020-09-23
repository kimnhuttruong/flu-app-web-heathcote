// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$AuthResponseSerializer implements Serializer<AuthResponse> {
  Serializer<User> __userSerializer;
  Serializer<User> get _userSerializer => __userSerializer ??= UserSerializer();
  @override
  Map<String, dynamic> toMap(AuthResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, 'token', model.token);
    setMapValueIfNotNull(ret, 'expiredIn', model.expiresIn);
    setMapValueIfNotNull(ret, 'user', _userSerializer.toMap(model.user));
    return ret;
  }

  @override
  AuthResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = AuthResponse();
    obj.token = map['token'] as String ?? getJserDefault('token') ?? obj.token;
    obj.expiresIn =
        map['expiredIn'] as int ?? getJserDefault('expiresIn') ?? obj.expiresIn;
    obj.user = _userSerializer.fromMap(map['user'] as Map) ??
        getJserDefault('user') ??
        obj.user;
    return obj;
  }
}
