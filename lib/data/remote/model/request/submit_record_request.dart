import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'submit_record_request.jser.dart';

class SubmitRecordRequest {
  @Alias('_batchId', isNullable: false)
  final String batchId;

  @Alias('patientPhoneNumber', isNullable: false)
  final String patientPhoneNumber;

  @Alias('nhsId', isNullable: false)
  final String nhsId;

  @Alias('orgId', isNullable: false)
  final String orgId;

  SubmitRecordRequest({this.batchId, this.patientPhoneNumber, this.nhsId, this.orgId});
}

@GenSerializer(nullableFields: true)
class SubmitRecordRequestSerializer extends Serializer<SubmitRecordRequest>
    with _$SubmitRecordRequestSerializer {}
