// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_record_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SubmitRecordResponseSerializer
    implements Serializer<SubmitRecordResponse> {
  @override
  Map<String, dynamic> toMap(SubmitRecordResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, '_id', model.id);
    setMapValueIfNotNull(ret, 'batchNumber', model.batchNumber);
    setMapValueIfNotNull(ret, 'message', model.message);
    return ret;
  }

  @override
  SubmitRecordResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = SubmitRecordResponse(
        id: map['_id'] as String ?? getJserDefault('id'),
        batchNumber:
            map['batchNumber'] as String ?? getJserDefault('batchNumber'),
        message: map['message'] as String ?? getJserDefault('message'));
    return obj;
  }
}
