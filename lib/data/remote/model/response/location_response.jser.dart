// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LocationResponseSerializer
    implements Serializer<LocationResponse> {
  Serializer<Location> __locationSerializer;
  Serializer<Location> get _locationSerializer =>
      __locationSerializer ??= LocationSerializer();
  @override
  Map<String, dynamic> toMap(LocationResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(
        ret,
        'locations',
        codeNonNullIterable(model.locations,
            (val) => _locationSerializer.toMap(val as Location), []));
    return ret;
  }

  @override
  LocationResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = LocationResponse();
    obj.locations = codeNonNullIterable<Location>(map['locations'] as Iterable,
            (val) => _locationSerializer.fromMap(val as Map), <Location>[]) ??
        getJserDefault('locations') ??
        obj.locations;
    return obj;
  }
}
