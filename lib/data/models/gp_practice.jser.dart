// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gp_practice.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$GpPracticeSerializer implements Serializer<GpPractice> {
  @override
  Map<String, dynamic> toMap(GpPractice model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'props',
        codeIterable(model.props, (val) => passProcessor.serialize(val)));
    setMapValueIfNotNull(ret, '_id', model.id);
    setMapValueIfNotNull(ret, 'name', model.name);
    setMapValueIfNotNull(ret, 'code', model.code);
    setMapValue(ret, 'stringify', model.stringify);
    return ret;
  }

  @override
  GpPractice fromMap(Map map) {
    if (map == null) return null;
    final obj = GpPractice(
        id: map['_id'] as String ?? getJserDefault('id'),
        name: map['name'] as String ?? getJserDefault('name'),
        code: map['code'] as String ?? getJserDefault('code'));
    return obj;
  }
}
