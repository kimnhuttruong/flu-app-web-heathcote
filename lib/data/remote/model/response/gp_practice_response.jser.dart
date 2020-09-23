// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gp_practice_response.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$GpPracticeResponseSerializer
    implements Serializer<GpPracticeResponse> {
  Serializer<GpPractice> __gpPracticeSerializer;
  Serializer<GpPractice> get _gpPracticeSerializer =>
      __gpPracticeSerializer ??= GpPracticeSerializer();
  @override
  Map<String, dynamic> toMap(GpPracticeResponse model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValueIfNotNull(
        ret,
        'organisations',
        codeNonNullIterable(model.organisations,
            (val) => _gpPracticeSerializer.toMap(val as GpPractice), []));
    return ret;
  }

  @override
  GpPracticeResponse fromMap(Map map) {
    if (map == null) return null;
    final obj = GpPracticeResponse();
    obj.organisations = codeNonNullIterable<GpPractice>(
            map['organisations'] as Iterable,
            (val) => _gpPracticeSerializer.fromMap(val as Map),
            <GpPractice>[]) ??
        getJserDefault('organisations') ??
        obj.organisations;
    return obj;
  }
}
