import 'package:b13_flutter/data/models/batch.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';

part 'batch_response.jser.dart';

class BatchResponse {
  @Alias('batches', isNullable: false)
  List<Batch> batches;
}

@GenSerializer(nullableFields: true)
class BatchResponseSerializer extends Serializer<BatchResponse> with _$BatchResponseSerializer {}
