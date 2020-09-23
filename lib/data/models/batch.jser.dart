// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BatchSerializer implements Serializer<Batch> {
  @override
  Map<String, dynamic> toMap(Batch model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'props',
        codeIterable(model.props, (val) => passProcessor.serialize(val)));
    setMapValueIfNotNull(ret, '_id', model.id);
    setMapValueIfNotNull(ret, 'batchNumber', model.batchNumber);
    setMapValueIfNotNull(ret, 'message', model.message);
    setMapValue(ret, 'stringify', model.stringify);
    return ret;
  }

  @override
  Batch fromMap(Map map) {
    if (map == null) return null;
    final obj = Batch(
        id: map['_id'] as String ?? getJserDefault('id'),
        batchNumber:
            map['batchNumber'] as String ?? getJserDefault('batchNumber'),
        message: map['message'] as String ?? getJserDefault('message'));
    return obj;
  }
}
