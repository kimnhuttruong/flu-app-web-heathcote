// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_code.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PatientCodeSerializer implements Serializer<PatientCode> {
  @override
  Map<String, dynamic> toMap(PatientCode model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'props',
        codeIterable(model.props, (val) => passProcessor.serialize(val)));
    setMapValueIfNotNull(ret, 'orgId', model.orgId);
    setMapValueIfNotNull(ret, 'nhsId', model.nhsId);
    setMapValue(ret, 'stringify', model.stringify);
    return ret;
  }

  @override
  PatientCode fromMap(Map map) {
    if (map == null) return null;
    final obj = PatientCode(
        orgId: map['orgId'] as String ?? getJserDefault('orgId'),
        nhsId: map['nhsId'] as String ?? getJserDefault('nhsId'));
    return obj;
  }
}
