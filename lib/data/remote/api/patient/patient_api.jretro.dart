// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patient_api.dart';

// **************************************************************************
// JaguarHttpGenerator
// **************************************************************************

abstract class _$PatientApiClient implements ApiClient {
  final String basePath = "";
  Future<Patient> getPatientByCode({String orgCode, String nhsId}) async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/:orgCode/Patient/info/:nhsId")
        .pathParams("orgCode", orgCode)
        .pathParams("nhsId", nhsId);
    return req.go(throwOnErr: true).map(decodeOne);
  }

  Future<List<Patient>> getPatientByInfo(
      {String orgCode,
      String firstName,
      String lastName,
      String birthDate}) async {
    var req = base.get
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/:orgCode/Patient/search")
        .pathParams("orgCode", orgCode)
        .query("firstName", firstName)
        .query("lastName", lastName)
        .query("birthDate", birthDate);
    return req.go(throwOnErr: true).map(decodeList);
  }

  Future<SubmitRecordResponse> submitRecord(SubmitRecordRequest body) async {
    var req = base.post
        .metadata({
          "auth": true,
        })
        .path(basePath)
        .path("/batch/send-sms")
        .json(jsonConverter.to(body));
    return req.go(throwOnErr: true).map(decodeOne);
  }
}
