import 'package:b13_flutter/data/models/gp_practice.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GpPracticeState extends Equatable {
  GpPracticeState([List props = const []]);
}

class GpPracticeInitialState extends GpPracticeState {
  @override
  List<Object> get props => [];
}

class GpPracticeLoadingState extends GpPracticeState {
  @override
  List<Object> get props => [];
}

class GpPracticeLoadedState extends GpPracticeState {
  final List<GpPractice> gpPractices;

  GpPracticeLoadedState(this.gpPractices);

  @override
  List<Object> get props => [gpPractices];
}

class GpPracticeErrorState extends GpPracticeState {
  final String message;

  GpPracticeErrorState(this.message);
  @override
  List<Object> get props => [message];
}
