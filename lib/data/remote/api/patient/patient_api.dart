import 'package:b13_flutter/data/models/patient.dart';
import 'package:b13_flutter/data/remote/model/request/submit_record_request.dart';
import 'package:b13_flutter/data/remote/model/response/submit_record_response.dart';
import 'package:jaguar_retrofit/client/client.dart';
import 'package:jaguar_retrofit/jaguar_retrofit.dart';
import 'package:jaguar_serializer/jaguar_serializer.dart';
part 'patient_api.jretro.dart';

@GenApiClient()
class PatientApi extends ApiClient with _$PatientApiClient {
  final Route base;
  @override
  final Map<String, CodecRepo> converters;
  final Duration timeout;

  PatientApi({
    this.base,
    this.converters,
    this.timeout = const Duration(minutes: 2),
  });

  @GetReq(
    path: '/:orgCode/Patient/info/:nhsId',
    metadata: {
      'auth': true,
    },
  )
  @override
  Future<Patient> getPatientByCode(
      {@PathParam('orgCode') String orgCode, @PathParam('nhsId') String nhsId}) {
    return super.getPatientByCode(orgCode: orgCode, nhsId: nhsId).timeout(timeout);
  }

  @GetReq(
    path: '/:orgCode/Patient/search',
    metadata: {
      'auth': true,
    },
  )
  @override
  Future<List<Patient>> getPatientByInfo({
    @PathParam('orgCode') String orgCode,
    @QueryParam('firstName') String firstName,
    @QueryParam('lastName') String lastName,
    @QueryParam('birthDate') String birthDate,
  }) {
    return super
        .getPatientByInfo(
          orgCode: orgCode,
          firstName: firstName,
          lastName: lastName,
          birthDate: birthDate,
        )
        .timeout(timeout);
  }

  @PostReq(
    path: '/batch/send-sms',
    metadata: {
      'auth': true,
    },
  )
  @override
  Future<SubmitRecordResponse> submitRecord(
    @AsJson() SubmitRecordRequest body,
  ) {
    return super.submitRecord(body).timeout(timeout);
  }
}
