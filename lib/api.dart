import 'package:b13_flutter/data/models/patient.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/data/remote/api/configuration/configuration_api.dart';
import 'package:b13_flutter/data/remote/api/patient/patient_api.dart';
import 'package:b13_flutter/data/remote/api/user/user_and_authentication_api.dart';
import 'package:b13_flutter/data/remote/interceptors/auth_interceptor.dart';
import 'package:b13_flutter/data/remote/model/request/login_user_request.dart';
import 'package:b13_flutter/data/remote/model/request/submit_record_request.dart';
import 'package:b13_flutter/data/remote/model/response/auth_response.dart';
import 'package:b13_flutter/data/remote/model/response/batch_response.dart';
import 'package:b13_flutter/data/remote/model/response/gp_practice_response.dart';
import 'package:b13_flutter/data/remote/model/response/location_response.dart';
import 'package:b13_flutter/data/remote/model/response/submit_record_response.dart';
import 'package:http/io_client.dart';
import 'package:http/http.dart';

import 'package:jaguar_mimetype/jaguar_mimetype.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

import 'data/models/patient.dart';

final _jsonJaguarRepo = JsonRepo()
  ..add(AuthResponseSerializer())
  ..add(UserSerializer())
  ..add(LoginUserRequestSerializer())
  ..add(PatientSerializer())
  ..add(SubmitRecordRequestSerializer())
  ..add(SubmitRecordResponseSerializer())
  ..add(BatchResponseSerializer())
  ..add(LocationResponseSerializer())
  ..add(GpPracticeResponseSerializer());

final Map<String, CodecRepo> defaultConverters = {
  MimeTypes.json: _jsonJaguarRepo,
};

class AppApi {
  String basePath = 'https://substrakt-uat-001.b13devops.com:8000/api/v1';
  Route _baseRoute;
  final Duration timeout;
  final authInterceptor = AuthInterceptor();

  AppApi({
    String baseUrl,
    List<Interceptor> interceptors,
    this.timeout = const Duration(minutes: 2),
  }) {
    _baseRoute = Route(baseUrl ?? basePath).withClient(globalClient ?? Client())
        as Route;

    _baseRoute.before(authInterceptor.before).after(authInterceptor.after);

    for (var interceptor in interceptors) {
      _baseRoute.before(interceptor.before).after(interceptor.after);
    }
  }

  void setApiKey(String name, String apiKey) {
    authInterceptor.apiKey = apiKey;
  }

  void removeApiKey(String name) {
    authInterceptor.apiKey = null;
  }

  UserAndAuthenticationApi getUserAndAuthenticationApi(
      {Route base, Map<String, CodecRepo> converters}) {
    base ??= _baseRoute;
    converters ??= defaultConverters;
    return UserAndAuthenticationApi(
        base: base, converters: converters, timeout: timeout);
  }

  PatientApi getPatientApi({Route base, Map<String, CodecRepo> converters}) {
    base ??= _baseRoute;
    converters ??= defaultConverters;
    return PatientApi(base: base, converters: converters, timeout: timeout);
  }

  ConfigurationApi getConfigurationApi(
      {Route base, Map<String, CodecRepo> converters}) {
    base ??= _baseRoute;
    converters ??= defaultConverters;
    return ConfigurationApi(
        base: base, converters: converters, timeout: timeout);
  }
}
