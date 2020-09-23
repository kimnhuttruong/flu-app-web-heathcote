// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$PatientSerializer implements Serializer<Patient> {
  @override
  Map<String, dynamic> toMap(Patient model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'birthDateFormatted', model.birthDateFormatted);
    setMapValue(ret, 'props',
        codeIterable(model.props, (val) => passProcessor.serialize(val)));
    setMapValueIfNotNull(ret, 'mobilePhoneNumber', model.mobilePhoneNumber);
    setMapValueIfNotNull(ret, 'telephoneNumber', model.telephoneNumber);
    setMapValueIfNotNull(ret, 'firstName', model.firstName);
    setMapValueIfNotNull(ret, 'surName', model.surName);
    setMapValueIfNotNull(ret, 'displayName', model.displayName);
    setMapValueIfNotNull(ret, 'birthDate', model.birthDate);
    setMapValueIfNotNull(ret, 'nhsId', model.nhsId);
    setMapValueIfNotNull(ret, 'emisId', model.emisId);
    setMapValueIfNotNull(ret, 'odsCode', model.odsCode);
    setMapValueIfNotNull(ret, 'gpName', model.gpPractice);
    setMapValue(ret, 'stringify', model.stringify);
    return ret;
  }

  @override
  Patient fromMap(Map map) {
    if (map == null) return null;
    final obj = Patient(
        mobilePhoneNumber: map['mobilePhoneNumber'] as String ??
            getJserDefault('mobilePhoneNumber'),
        telephoneNumber: map['telephoneNumber'] as String ??
            getJserDefault('telephoneNumber'),
        firstName: map['firstName'] as String ?? getJserDefault('firstName'),
        surName: map['surName'] as String ?? getJserDefault('surName'),
        displayName:
            map['displayName'] as String ?? getJserDefault('displayName'),
        birthDate: map['birthDate'] as String ?? getJserDefault('birthDate'),
        nhsId: map['nhsId'] as String ?? getJserDefault('nhsId'),
        emisId: map['emisId'] as String ?? getJserDefault('emisId'),
        odsCode: map['odsCode'] as String ?? getJserDefault('odsCode'),
        gpPractice: map['gpName'] as String ?? getJserDefault('gpPractice'));
    return obj;
  }
}
