import 'package:b13_flutter/data/remote/model/response/batch_response.dart';
import 'package:b13_flutter/data/remote/model/response/gp_practice_response.dart';
import 'package:b13_flutter/data/remote/model/response/location_response.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'configuration_api.jretro.dart';

@GenApiClient()
class ConfigurationApi extends ApiClient with _$ConfigurationApiClient {
  final Route base;
  @override
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  ConfigurationApi({
    this.base,
    this.converters,
    this.timeout,
  });

  @GetReq(
    path: '/location',
    metadata: {
      'auth': true,
    },
  )
  Future<LocationResponse> getLocations() async {
    return super.getLocations().timeout(timeout);
  }

  @GetReq(path: '/organisation', metadata: {
    'auth': true,
  })
  Future<GpPracticeResponse> getGpPractices() async {
    return super.getGpPractices().timeout(timeout);
  }

  @GetReq(
    path: '/batch',
    metadata: {
      'auth': true,
    },
  )
  @override
  Future<BatchResponse> getBatches() {
    return super.getBatches().timeout(timeout);
  }
}
