// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$LocationSerializer implements Serializer<Location> {
  @override
  Map<String, dynamic> toMap(Location model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'props',
        codeIterable(model.props, (val) => passProcessor.serialize(val)));
    setMapValueIfNotNull(ret, '_id', model.id);
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValue(ret, 'stringify', model.stringify);
    return ret;
  }

  @override
  Location fromMap(Map map) {
    if (map == null) return null;
    final obj = Location(
        id: map['_id'] as String ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'));
    return obj;
  }
}
