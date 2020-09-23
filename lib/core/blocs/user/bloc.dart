library core.blocs.user;

import 'dart:async';

import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/repositories/user/user_repository.dart';
import 'package:b13_flutter/data/models/location.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/data/remote/model/login_user.dart';
import 'package:b13_flutter/shared/utils/network_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'user_bloc.dart';
part 'user_events.dart';
part 'user_state.dart';
