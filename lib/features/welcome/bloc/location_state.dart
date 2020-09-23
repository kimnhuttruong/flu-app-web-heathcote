import 'package:b13_flutter/data/models/location.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LocationState extends Equatable {
  LocationState([List props = const []]);
}

class LocationInitialState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoadingState extends LocationState {
  @override
  List<Object> get props => [];
}

class LocationLoadedState extends LocationState {
  final List<Location> locations;

  LocationLoadedState(this.locations);

  @override
  List<Object> get props => [locations];
}

class LocationErrorState extends LocationState {
  final String message;

  LocationErrorState(this.message);
  @override
  List<Object> get props => [message];
}
