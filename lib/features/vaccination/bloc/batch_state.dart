import 'package:b13_flutter/data/models/batch.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BatchState extends Equatable {
  BatchState([List props = const []]);
}

class BatchInitialState extends BatchState {
  @override
  List<Object> get props => [];
}

class BatchLoadingState extends BatchState {
  @override
  List<Object> get props => [];
}

class BatchLoadedState extends BatchState {
  final List<Batch> batches;

  BatchLoadedState(this.batches);

  @override
  List<Object> get props => [batches];
}

class BatchErrorState extends BatchState {
  final String message;

  BatchErrorState(this.message);
  @override
  List<Object> get props => [message];
}
