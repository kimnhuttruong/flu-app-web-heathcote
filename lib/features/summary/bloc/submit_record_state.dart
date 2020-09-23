import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SubmitRecordState extends Equatable {
  SubmitRecordState([List props = const []]);
}

class SubmitRecordInitialState extends SubmitRecordState {
  @override
  List<Object> get props => [];
}

class SubmittingRecordState extends SubmitRecordState {
  @override
  List<Object> get props => [];
}

class SubmittedRecordState extends SubmitRecordState {
  @override
  List<Object> get props => [];
}

class SubmitRecordErrorState extends SubmitRecordState {
  final String message;

  SubmitRecordErrorState(this.message);

  @override
  List<Object> get props => [message];
}
