import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/features/welcome/bloc/location_event.dart';
import 'package:b13_flutter/features/welcome/bloc/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final ConfigurationRepository configurationRepository;
  LocationBloc({@required this.configurationRepository}) : super(LocationInitialState());

  @override
  Stream<LocationState> mapEventToState(LocationEvent event) async* {
    switch (event.runtimeType) {
      case LoadLocationEvent:
        yield* _loadLocation();
        break;
      default:
    }
  }

  Stream<LocationState> _loadLocation() async* {
    try {
      yield LocationLoadingState();
      final locations = await configurationRepository.getLocations();
      yield LocationLoadedState(locations);
    } catch (e) {
      yield LocationErrorState(e.toString());
    }
  }
}
