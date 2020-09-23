import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'gp_practice_event.dart';
import 'gp_practice_state.dart';

class GpPracticeBloc extends Bloc<GpPracticeEvent, GpPracticeState> {
  final ConfigurationRepository configurationRepository;
  GpPracticeBloc({
    @required this.configurationRepository,
  }) : super(GpPracticeInitialState());

  @override
  Stream<GpPracticeState> mapEventToState(GpPracticeEvent event) async* {
    switch (event.runtimeType) {
      case LoadGpPracticeEvent:
        yield* _loadGpPractice();
        break;
      default:
    }
  }

  Stream<GpPracticeState> _loadGpPractice() async* {
    try {
      yield GpPracticeLoadingState();
      final gpPractices = await configurationRepository.getGpPractice();
      yield GpPracticeLoadedState(gpPractices);
    } catch (e) {
      yield GpPracticeErrorState(e.toString());
    }
  }
}
