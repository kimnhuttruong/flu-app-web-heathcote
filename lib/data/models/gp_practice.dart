import 'package:equatable/equatable.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'gp_practice.jser.dart';

class GpPractice extends Equatable {
  @Alias('_id', isNullable: false)
  final String id;

  @Alias('name', isNullable: false)
  final String name;

  @Alias('code', isNullable: false)
  final String code;

  GpPractice({
    this.id,
    this.name,
    this.code,
  });

  @override
  List<Object> get props => [name, code];
}

@GenSerializer(nullableFields: true)
class GpPracticeSerializer extends Serializer<GpPractice> with _$GpPracticeSerializer {}
