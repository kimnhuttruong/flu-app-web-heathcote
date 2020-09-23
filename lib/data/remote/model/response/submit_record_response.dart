import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'submit_record_response.jser.dart';

class SubmitRecordResponse {
  @Alias('_id', isNullable: false)
  final String id;

  @Alias('batchNumber', isNullable: false)
  final String batchNumber;

  @Alias('message', isNullable: false)
  final String message;

  SubmitRecordResponse({this.id, this.batchNumber, this.message});
}

@GenSerializer(nullableFields: true)
class SubmitRecordResponseSerializer extends Serializer<SubmitRecordResponse>
    with _$SubmitRecordResponseSerializer {}
