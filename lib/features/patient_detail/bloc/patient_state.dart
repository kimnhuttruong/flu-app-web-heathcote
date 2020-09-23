import 'package:b13_flutter/data/models/patient.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class PatientState extends Equatable {
  PatientState([List props = const []]);
}

class PatientInitialState extends PatientState {
  @override
  List<Object> get props => [];
}

class PatientDetailLoading extends PatientState {
  @override
  List<Object> get props => [];
}

class PatientDetailLoaded extends PatientState {
  final Patient patient;

  PatientDetailLoaded(this.patient);

  @override
  List<Object> get props => [patient];
}

class PatientError extends PatientState {
  final String message;

  PatientError(this.message);

  @override
  List<Object> get props => [message];
}
