import 'package:b13_flutter/application.dart';
import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/core/repositories/patient/patient_repository.dart';
import 'package:b13_flutter/core/repositories/user/user_repository.dart';
import 'package:b13_flutter/localizations/app_localizations.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/routes.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MainApp extends StatelessWidget {
  final Application application;

  const MainApp({
    this.application,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserRepository>.value(
          value: application.userRepository,
        ),
        RepositoryProvider<PatientRepository>.value(
          value: application.patientRepository,
        ),
        RepositoryProvider<ConfigurationRepository>.value(
          value: application.configurationRepository,
        )
      ],
      child: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          return MaterialApp(
            locale: const Locale('en', ''),
            onGenerateTitle: (BuildContext context) => getTranslated(context, 'appname'),
            color: Colors.green,
            theme: ThemeData(primaryColor: AppColor.primaryColor, fontFamily: 'Frutiger'),
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            supportedLocales: [Locale.fromSubtags(languageCode: 'en', countryCode: 'GB')],
            onGenerateRoute: routes(application: application),
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              ScreenUtil.init(context);
              return widget;
            },
          );
        },
      ),
    );
  }
}
