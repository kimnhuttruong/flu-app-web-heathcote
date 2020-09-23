import 'package:b13_flutter/data/models/location.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'location_response.jser.dart';

class LocationResponse {
  @Alias('locations', isNullable: false)
  List<Location> locations;
}

@GenSerializer(nullableFields: true)
class LocationResponseSerializer extends Serializer<LocationResponse>
    with _$LocationResponseSerializer {}
