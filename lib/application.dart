import 'package:b13_flutter/api.dart';
import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/core/repositories/patient/patient_repository.dart';
import 'package:b13_flutter/core/repositories/user/user_repository.dart';
import 'package:b13_flutter/data/remote/interceptors/log_interceptor.dart';
import 'package:b13_flutter/data/shared_preference/user_shared_preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Config {}

class Application {
  UserRepository userRepository;
  PatientRepository patientRepository;
  ConfigurationRepository configurationRepository;

  Config config;
  AuthBloc authBloc;
  UserBloc userBloc;

  String location;

  AppApi _api;

  Application({this.config});

  Future<void> setup() async {
    _api = AppApi(interceptors: [
      LogInterceptor(),
    ]);
    await setupRepositories();

    final accessToken = await userRepository.getAccessToken();
    var isAuthenticated = false;
    if (accessToken != null) {
      try {
        _api.setApiKey('Token', accessToken);
        isAuthenticated = true;
      } catch (error) {
        await userRepository.removeAccessToken();
      }
    }
    setupBlocs(isAuthenticated: isAuthenticated);
  }

  Future<void> setupRepositories() async {
    final sharePreferences = await SharedPreferences.getInstance();
    final userApi = _api.getUserAndAuthenticationApi();
    final userStorage = UserSharedPreference(sharePreferences);
    userRepository = UserRepository(api: _api, userApi: userApi, userStorage: userStorage);

    // Patient
    final patientApi = _api.getPatientApi();
    patientRepository = PatientRepository(patientApi);

    // Configuration
    final configurationApi = _api.getConfigurationApi();
    configurationRepository = ConfigurationRepository(configurationApi);
  }

  void setupBlocs({bool isAuthenticated}) {
    authBloc = AuthBloc(userRepository: userRepository);
    userBloc = UserBloc(userRepository: userRepository, authBloc: authBloc);
  }

  Future<void> init() async {
    userBloc.add(UserClearEvent());
  }

  void close() {
    authBloc.close();
    userBloc.close();
  }
}
