import 'dart:convert';
import 'package:b13_flutter/data/remote/model/response/server_error.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';

class NetworkUtils {
  static String parseError(Object error) {
    if (error is StringResponse) {
      try {
        final body = jsonDecode(error.body) as Map<String, dynamic>;
        final serverErr = ServerError.fromJson(body);
        return serverErr.issue[0].error;
      } catch (e) {
        print(e);
      }
    }
    return "Oops something went wrong! Please check your connection and try again.";
  }
}
