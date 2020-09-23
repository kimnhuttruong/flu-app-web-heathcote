import 'dart:async';

import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/repositories/patient/patient_repository.dart';
import 'package:b13_flutter/features/patient_detail/bloc/patient_event.dart';
import 'package:b13_flutter/features/patient_detail/bloc/patient_state.dart';
import 'package:b13_flutter/shared/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PatientBloc extends Bloc<PatientEvent, PatientState> {
  final PatientRepository patientRepository;
  final AuthBloc authBloc;
  StreamSubscription _authBlocSubscription;

  PatientBloc({@required this.patientRepository, @required this.authBloc})
      : super(PatientInitialState()) {
    _authBlocSubscription = authBloc.listen((state) {
      if (state is NotAuthenticated) {
        add(ClearPatientEvent());
      }
    });
  }

  @override
  Future<void> close() {
    _authBlocSubscription.cancel();
    return super.close();
  }

  @override
  Stream<PatientState> mapEventToState(PatientEvent event) async* {
    switch (event.runtimeType) {
      case ClearPatientEvent:
        yield PatientInitialState();
        break;
      case LoadPatientByCodeEvent:
        yield* _loadPatientByCode(event);
        break;
      case LoadPatientByInfoEvent:
        yield* _loadPatientByInfo(event);
        break;
      default:
    }
  }

  Stream<PatientState> _loadPatientByCode(LoadPatientByCodeEvent event) async* {
    try {
      yield PatientDetailLoading();
      final patient = await patientRepository.getPatientByCode(
          event.patientCode.orgId, event.patientCode.nhsId);
      yield PatientDetailLoaded(patient);
    } catch (error) {
      yield PatientError(NetworkUtils.parseError(error));
    }
  }

  Stream<PatientState> _loadPatientByInfo(LoadPatientByInfoEvent event) async* {
    try {
      yield PatientDetailLoading();
      final patient = await patientRepository.getPatientByInfo(event.params);
      yield PatientDetailLoaded(patient);
    } catch (error) {
      yield PatientError(NetworkUtils.parseError(error));
    }
  }
}
