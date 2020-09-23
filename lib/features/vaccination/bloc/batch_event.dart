import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class BatchEvent extends Equatable {
  BatchEvent([List props = const []]);
}

class LoadBatchEvent extends BatchEvent {
  @override
  List<Object> get props => [];
}
