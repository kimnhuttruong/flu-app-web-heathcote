import 'package:b13_flutter/application.dart';
import 'package:b13_flutter/features/find_patient/screen/patient_manual_input/patient_manual_input.dart';
import 'package:b13_flutter/features/find_patient/screen/scan_barcode.dart';
import 'package:b13_flutter/features/flash/flash.dart';
import 'package:b13_flutter/features/login/screen/sign_in.dart';
import 'package:b13_flutter/features/patient_detail/screen/patient_detail.dart';
import 'package:b13_flutter/features/summary/screen/submitted_screen.dart';
import 'package:b13_flutter/features/summary/screen/summary_screen.dart';
import 'package:b13_flutter/features/vaccination/screen/vaccination_screen.dart';
import 'package:b13_flutter/features/welcome/screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var bootStage = 1;

RouteFactory routes({@required Application application}) {
  return (RouteSettings settings) {
    var fullScreen = false;
    Widget screen;

    if (bootStage == 1) {
      bootStage = 2;
      return PageRouteBuilder(
        pageBuilder: (_, __, ___) => FlashScreen(),
      );
    }
    final agruments = settings.arguments as Map<String, dynamic> ?? {};
    switch (settings.name) {
      case SignInScreen.route:
        fullScreen = true;
        screen = SignInScreen();
        break;
      case WelcomeScreen.route:
        screen = WelcomeScreen();
        break;
      case ScanBarcodeScreen.route:
        screen = ScanBarcodeScreen();
        break;
      case PatientDetailScreen.route:
        screen = PatientDetailScreen(
          patientCode: agruments['patientCode'],
          searchPatient: agruments['searchPatient'],
        );
        break;
      case PatientManualInputScreen.route:
        screen = PatientManualInputScreen();
        break;
      case VaccinationScreen.route:
        screen = VaccinationScreen(
          patient: agruments['patient'],
        );
        break;
      case SummaryScreen.route:
        screen = SummaryScreen(
          batch: agruments['batch'],
          vacciPosition: agruments['vacciPosition'],
          patient: agruments['patient'],
        );
        break;
      case SubmittedRecordScreen.route:
        screen = SubmittedRecordScreen();
        break;
    }
    if (bootStage == 2) {
      bootStage = 3;

      return PageRouteBuilder(
        pageBuilder: (BuildContext context, _, __) {
          return screen;
        },
        transitionDuration: const Duration(milliseconds: 500),
      );
    }

    if (fullScreen) {
      return MaterialPageRoute(
        builder: (_) => screen,
        fullscreenDialog: true,
      );
    }

    return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) {
      return screen;
    }, transitionsBuilder: (_, Animation<double> animation, __, Widget child) {
      return FadeTransition(opacity: animation, child: child);
    });
  };
}
