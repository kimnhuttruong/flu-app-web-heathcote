import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GpPracticeEvent extends Equatable {
  GpPracticeEvent([List props = const []]);
}

class LoadGpPracticeEvent extends GpPracticeEvent {
  @override
  List<Object> get props => [];
}
