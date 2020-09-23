import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LocationEvent extends Equatable {
  LocationEvent([List props = const []]);
}

class LoadLocationEvent extends LocationEvent {
  @override
  List<Object> get props => [];
}
