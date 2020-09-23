import 'package:b13_flutter/data/models/gp_practice.dart';
import 'package:b13_flutter/data/models/location.dart';
import 'package:b13_flutter/data/models/batch.dart';

import 'package:b13_flutter/data/remote/api/configuration/configuration_api.dart';

class ConfigurationRepository {
  final ConfigurationApi configurationApi;

  ConfigurationRepository(this.configurationApi);

  Future<List<Location>> getLocations() async {
    final response = await configurationApi.getLocations();
    return response.locations;
  }

  Future<List<GpPractice>> getGpPractice() async {
    final response = await configurationApi.getGpPractices();
    return response.organisations;
  }

  Future<List<Batch>> getBatches() async {
    final response = await configurationApi.getBatches();
    return response.batches;
  }
}
