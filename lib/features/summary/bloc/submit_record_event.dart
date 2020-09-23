import 'package:b13_flutter/data/remote/model/request/submit_record_request.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SubmitRecordEvent extends Equatable {
  SubmitRecordEvent([List props = const []]);
}

class SubmitRecordRequestEvent extends SubmitRecordEvent {
  final SubmitRecordRequest params;

  SubmitRecordRequestEvent(this.params);

  @override
  List<Object> get props => [params];
}
