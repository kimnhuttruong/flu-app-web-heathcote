import 'package:b13_flutter/data/models/patient.dart';
import 'package:b13_flutter/data/remote/api/patient/patient_api.dart';
import 'package:b13_flutter/data/remote/model/request/submit_record_request.dart';
import 'package:b13_flutter/data/remote/model/response/submit_record_response.dart';
import 'package:b13_flutter/data/remote/model/search_patient.dart';

class PatientRepository {
  final PatientApi patientApi;

  PatientRepository(this.patientApi);

  Future<Patient> getPatientByCode(String orgCode, String nhsId) async {
    final result = await patientApi.getPatientByCode(orgCode: orgCode, nhsId: nhsId);
    return result;
  }

  Future<Patient> getPatientByInfo(SearchPatient params) async {
    final result = await patientApi.getPatientByInfo(
      orgCode: params.orgCode,
      firstName: params.firstName,
      lastName: params.surname,
      birthDate: params.dateOfBirth,
    );
    return result.isNotEmpty ? result.first : null;
  }

  Future<SubmitRecordResponse> submitRecord(SubmitRecordRequest params) async {
    final result = await patientApi.submitRecord(params);
    return result;
  }
}
