import 'package:b13_flutter/app.dart';
import 'package:b13_flutter/application.dart';
import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/blocs/user/bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'core/blocs/supervisor_bloc/supervisor_bloc.dart';

void main() async {
  Provider.debugCheckInvalidValueType = null;
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = SupervisorBloc();
  final application = Application();
  await application.setup();
  await application.init();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<AuthBloc>.value(value: application.authBloc),
      BlocProvider<UserBloc>.value(value: application.userBloc),
    ],
    child: MainApp(application: application),
  ));
}
