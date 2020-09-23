import 'dart:async';

import 'package:b13_flutter/core/repositories/patient/patient_repository.dart';
import 'package:b13_flutter/features/summary/bloc/submit_record_event.dart';
import 'package:b13_flutter/features/summary/bloc/submit_record_state.dart';
import 'package:b13_flutter/shared/utils/network_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SubmitRecordBloc extends Bloc<SubmitRecordEvent, SubmitRecordState> {
  final PatientRepository patientRepository;

  SubmitRecordBloc({@required this.patientRepository}) : super(SubmitRecordInitialState());

  @override
  Stream<SubmitRecordState> mapEventToState(SubmitRecordEvent event) async* {
    if (event is SubmitRecordRequestEvent) {
      yield* _submitRecord(event);
    }
  }

  Stream<SubmitRecordState> _submitRecord(SubmitRecordRequestEvent event) async* {
    try {
      yield SubmittingRecordState();
      await patientRepository.submitRecord(event.params);
      yield SubmittedRecordState();
    } catch (error) {
      yield SubmitRecordErrorState(NetworkUtils.parseError(error));
    }
  }
}
