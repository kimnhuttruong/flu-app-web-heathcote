// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'submit_record_request.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$SubmitRecordRequestSerializer
    implements Serializer<SubmitRecordRequest> {
  @override
  Map<String, dynamic> toMap(SubmitRecordRequest model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(ret, '_batchId', model.batchId);
    setMapValueIfNotNull(ret, 'patientPhoneNumber', model.patientPhoneNumber);
    setMapValueIfNotNull(ret, 'nhsId', model.nhsId);
    setMapValueIfNotNull(ret, 'orgId', model.orgId);
    return ret;
  }

  @override
  SubmitRecordRequest fromMap(Map map) {
    if (map == null) return null;
    final obj = SubmitRecordRequest(
        batchId: map['_batchId'] as String ?? getJserDefault('batchId'),
        patientPhoneNumber: map['patientPhoneNumber'] as String ??
            getJserDefault('patientPhoneNumber'),
        nhsId: map['nhsId'] as String ?? getJserDefault('nhsId'),
        orgId: map['orgId'] as String ?? getJserDefault('orgId'));
    return obj;
  }
}
