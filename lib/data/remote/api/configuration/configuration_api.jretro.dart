// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configuration_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$ConfigurationApiClient implements ApiClient {
  final String basePath = "";
  Future<LocationResponse> getLocations() async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/location");
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<GpPracticeResponse> getGpPractices() async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/organisation");
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<BatchResponse> getBatches() async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/batch");
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
