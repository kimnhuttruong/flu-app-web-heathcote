import 'package:b13_flutter/api.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/data/remote/api/user/user_and_authentication_api.dart';
import 'package:b13_flutter/data/remote/model/login_user.dart';
import 'package:b13_flutter/data/remote/model/request/login_user_request.dart';
import 'package:b13_flutter/data/remote/model/response/auth_response.dart';
import 'package:b13_flutter/data/shared_preference/user_shared_preference.dart';
import 'package:b13_flutter/shared/helpers/event_emitter.dart';

class UserRepository extends EventEmitter {
  final AppApi api;
  final UserAndAuthenticationApi userApi;
  final UserSharedPreference userStorage;

  UserRepository({
    this.api,
    this.userApi,
    this.userStorage,
  });

  Future<User> getCurrentUser() async {
    final result = await userApi.getCurrentUser();
    return result;
  }

  Future<AuthResponse> login(LoginUser user) async {
    final result = await userApi.login(LoginUserRequest(user: user));
    return result;
  }

  Future<void> setAccessToken(String accessToken) async {
    api.setApiKey('Token', accessToken);
    await userStorage.setToken(accessToken);
  }

  Future<String> getAccessToken() async {
    final token = userStorage.token;
    return token;
  }

  Future<bool> isAuthenticated() async {
    final token = await getAccessToken();
    return token != null;
  }

  Future<void> removeAccessToken() async {
    api.setApiKey('Token', null);
    return userStorage.setToken(null);
  }
}
