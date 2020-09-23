import 'package:equatable/equatable.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'location.jser.dart';

class Location extends Equatable {
  @Alias('_id', isNullable: false)
  final String id;

  @Alias('name', isNullable: false)
  final String name;

  Location({
    this.id,
    this.name,
  });

  @override
  List<Object> get props => [id, name];
}

@GenSerializer(nullableFields: true)
class LocationSerializer extends Serializer<Location> with _$LocationSerializer {}
