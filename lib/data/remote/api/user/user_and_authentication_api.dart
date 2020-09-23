import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/data/remote/model/request/login_user_request.dart';
import 'package:b13_flutter/data/remote/model/response/auth_response.dart';
import 'package:jaguar_retrofit/annotations/annotations.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'user_and_authentication_api.jretro.dart';

@GenApiClient()
class UserAndAuthenticationApi extends ApiClient
    with _$UserAndAuthenticationApiClient {
  final Route base;
  @override
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  UserAndAuthenticationApi({
    this.base,
    this.converters,
    this.timeout = const Duration(minutes: 2),
  });

  @PostReq(path: '/auth/login-no-org')
  @override
  Future<AuthResponse> login(@AsJson() LoginUserRequest body) {
    return super.login(body).timeout(timeout);
  }

  @GetReq(
    path: '/auth/info',
    metadata: {
      'auth': true,
    },
  )
  @override
  Future<User> getCurrentUser() {
    return super.getCurrentUser().timeout(timeout);
  }
}
