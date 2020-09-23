import 'package:equatable/equatable.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'batch.jser.dart';

class Batch extends Equatable {
  @Alias('_id', isNullable: false)
  final String id;

  @Alias('batchNumber', isNullable: false)
  final String batchNumber;

  @Alias('message', isNullable: false)
  final String message;

  Batch({
    this.id,
    this.batchNumber,
    this.message,
  });

  @override
  List<Object> get props => [id, batchNumber, message];
}

@GenSerializer(nullableFields: true)
class BatchSerializer extends Serializer<Batch> with _$BatchSerializer {}
