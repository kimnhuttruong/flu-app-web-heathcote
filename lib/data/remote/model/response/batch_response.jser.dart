// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'batch_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$BatchResponseSerializer implements Serializer<BatchResponse> {
  Serializer<Batch> __batchSerializer;
  Serializer<Batch> get _batchSerializer =>
      __batchSerializer ??= BatchSerializer();
  @override
  Map<String, dynamic> toMap(BatchResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(
        ret,
        'batches',
        codeNonNullIterable(
            model.batches, (val) => _batchSerializer.toMap(val as Batch), []));
    return ret;
  }

  @override
  BatchResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = BatchResponse();
    obj.batches = codeNonNullIterable<Batch>(map['batches'] as Iterable,
            (val) => _batchSerializer.fromMap(val as Map), <Batch>[]) ??
        getJserDefault('batches') ??
        obj.batches;
    return obj;
  }
}
