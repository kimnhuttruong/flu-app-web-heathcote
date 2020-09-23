// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_and_authentication_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$UserAndAuthenticationApiClient implements ApiClient {
  final String basePath = "";
  Future<AuthResponse> login(LoginUserRequest body) async {
    var req = base.post
        .path(basePath)
        .path("/auth/login-no-org")
        .json(jsonConverter.to(body));
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<User> getCurrentUser() async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/auth/info");
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
