// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$UserSerializer implements Serializer<User> {
  Serializer<Location> __locationSerializer;
  Serializer<Location> get _locationSerializer =>
      __locationSerializer ??= LocationSerializer();
  @override
  Map<String, dynamic> toMap(User model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(ret, 'props',
        codeIterable(model.props, (val) => passProcessor.serialize(val)));
    setMapValueIfNotNull(ret, '_id', model.id);
    setMapValueIfNotNull(ret, 'email', model.email);
    setMapValueIfNotNull(ret, 'role', model.role);
    setMapValueIfNotNull(ret, 'firstName', model.firstName);
    setMapValueIfNotNull(ret, 'surName', model.surName);
    setMapValueIfNotNull(ret, 'mobileTel', model.mobileTel);
    setMapValueIfNotNull(ret, 'title', model.title);
    setMapValueIfNotNull(ret, 'sex', model.sex);
    setMapValue(ret, 'location', _locationSerializer.toMap(model.location));
    setMapValue(ret, 'stringify', model.stringify);
    return ret;
  }

  @override
  User fromMap(Map map) {
    if (map == null) return null;
    final obj = User(
        id: map['_id'] as String ?? getJserDefault('id'),
        email: map['email'] as String ?? getJserDefault('email'),
        role: map['role'] as int ?? getJserDefault('role'),
        firstName: map['firstName'] as String ?? getJserDefault('firstName'),
        surName: map['surName'] as String ?? getJserDefault('surName'),
        mobileTel: map['mobileTel'] as String ?? getJserDefault('mobileTel'),
        title: map['title'] as String ?? getJserDefault('title'),
        sex: map['sex'] as String ?? getJserDefault('sex'));
    obj.location = _locationSerializer.fromMap(map['location'] as Map);
    return obj;
  }
}
