import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class SupervisorBloc extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
    debugPrint('Event ${event.runtimeType} of ${bloc.runtimeType}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    debugPrint('Transition ${bloc.runtimeType}\n'
        'Current state: ${transition.currentState.runtimeType}\n'
        'Event: ${transition.event.runtimeType}\n'
        'Next state: ${transition.nextState.runtimeType}');
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    debugPrint('${bloc.runtimeType} Errored');
  }
}
