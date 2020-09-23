library core.blocs.auth;

import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/core/repositories/user/user_repository.dart';
import 'package:b13_flutter/data/remote/model/login_user.dart';
import 'package:b13_flutter/shared/utils/network_utils.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'auth_bloc.dart';
part 'auth_events.dart';
part 'auth_state.dart';
