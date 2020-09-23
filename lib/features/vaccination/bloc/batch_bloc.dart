import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_event.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BatchBloc extends Bloc<BatchEvent, BatchState> {
  final ConfigurationRepository configurationRepository;
  BatchBloc({@required this.configurationRepository}) : super(BatchInitialState());

  @override
  Stream<BatchState> mapEventToState(BatchEvent event) async* {
    switch (event.runtimeType) {
      case LoadBatchEvent:
        yield* _loadBatches();
        break;
      default:
    }
  }

  Stream<BatchState> _loadBatches() async* {
    try {
      yield BatchLoadingState();
      final batches = await configurationRepository.getBatches();
      yield BatchLoadedState(batches);
    } catch (e) {
      yield BatchErrorState(e.toString());
    }
  }
}
