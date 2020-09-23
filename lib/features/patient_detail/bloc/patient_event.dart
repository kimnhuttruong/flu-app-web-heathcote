import 'package:b13_flutter/data/models/patient_code.dart';
import 'package:b13_flutter/data/remote/model/search_patient.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PatientEvent extends Equatable {
  PatientEvent([List props = const []]);
}

class LoadPatientByCodeEvent extends PatientEvent {
  final PatientCode patientCode;

  LoadPatientByCodeEvent(this.patientCode);

  @override
  List<Object> get props => [patientCode];
}

class LoadPatientByInfoEvent extends PatientEvent {
  final SearchPatient params;

  LoadPatientByInfoEvent(this.params);

  @override
  List<Object> get props => [params];
}

class ClearPatientEvent extends PatientEvent {
  @override
  List<Object> get props => [];
}
