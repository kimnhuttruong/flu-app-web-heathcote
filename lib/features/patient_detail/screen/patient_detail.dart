import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/repositories/patient/patient_repository.dart';
import 'package:b13_flutter/data/models/patient_code.dart';
import 'package:b13_flutter/data/remote/model/search_patient.dart';
import 'package:b13_flutter/features/find_patient/screen/scan_barcode.dart';
import 'package:b13_flutter/features/patient_detail/bloc/patient_bloc.dart';
import 'package:b13_flutter/features/patient_detail/bloc/patient_event.dart';
import 'package:b13_flutter/features/patient_detail/bloc/patient_state.dart';
import 'package:b13_flutter/features/vaccination/screen/vaccination_screen.dart';
import 'package:b13_flutter/shared/widgets/item_summary.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/widgets/error_container.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class PatientDetailScreen extends StatefulWidget {
  static const String route = '/patient-detail';
  final PatientCode patientCode;
  final SearchPatient searchPatient;

  const PatientDetailScreen({
    Key key,
    this.patientCode,
    this.searchPatient,
  }) : super(key: key);

  @override
  _PatientDetailPageState createState() => _PatientDetailPageState();
}

class _PatientDetailPageState extends State<PatientDetailScreen> {
  PatientBloc _patientBloc;

  @override
  void initState() {
    _patientBloc = PatientBloc(
        patientRepository: RepositoryProvider.of<PatientRepository>(context),
        authBloc: BlocProvider.of<AuthBloc>(context));
    if (widget.patientCode != null) {
      _patientBloc.add(LoadPatientByCodeEvent(widget.patientCode));
    } else {
      _patientBloc.add(LoadPatientByInfoEvent(widget.searchPatient));
    }
    super.initState();
  }

  @override
  void dispose() {
    _patientBloc.close();
    super.dispose();
  }

  void _goBack() {
    if (widget.patientCode != null) {
      Navigator.of(context).pushReplacementNamed(ScanBarcodeScreen.route);
    } else {
      Navigator.of(context).pop();
    }
  }

  Future<bool> _onBackPressed() {
    _goBack();
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: BlocProvider.value(
        value: _patientBloc,
        child: PageFrameWidget(
          onCancel: _goBack,
          child: Center(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Text(
                    getTranslated(context, 'home.patientRetrived'),
                    style: headerStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  child: Text(
                    getTranslated(context, 'home.confirmInfo'),
                    style: regularStyle,
                  ),
                ),
                BlocBuilder<PatientBloc, PatientState>(
                  builder: (context, state) {
                    if (state is PatientDetailLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is PatientError) {
                      return Center(
                        child: ErrorContainer(
                          error: getTranslated(context, 'home.patientNotFound'),
                        ),
                      );
                    }
                    if (state is PatientDetailLoaded) {
                      final patient = state.patient;
                      if (patient == null) {
                        return Center(
                          child: ErrorContainer(
                            error:
                                getTranslated(context, 'home.patientNotFound'),
                          ),
                        );
                      }
                      return FractionallySizedBox(
                        widthFactor: 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ItemSummaryWidget(
                              content: patient.displayName,
                              label: getTranslated(context, 'home.name'),
                            ),
                            ItemSummaryWidget(
                              content: patient.birthDateFormatted,
                              label: getTranslated(context, 'home.dateOfBirth'),
                            ),
                            ItemSummaryWidget(
                              content: patient?.gpPractice ?? '',
                              label: getTranslated(context, 'home.gp'),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 21.h),
                              child: Row(
                                children: <Widget>[
                                  RoundedButton(
                                    text: getTranslated(
                                        context, 'common.continue'),
                                    backgroundColor: AppColor.fernGreen,
                                    onPressed: () =>
                                        Navigator.of(context).pushNamed(
                                      VaccinationScreen.route,
                                      arguments: {
                                        'patient': patient,
                                      },
                                    ),
                                  ),
                                  RoundedButton(
                                    text: getTranslated(
                                        context, 'home.rescanBarcode'),
                                    backgroundColor: AppColor.primaryColor,
                                    margin: EdgeInsets.only(left: 24.w),
                                    onPressed: () => Navigator.of(context)
                                        .pushReplacementNamed(
                                            ScanBarcodeScreen.route),
                                  ),
                                  Expanded(
                                    child: widget.patientCode != null
                                        ? SizedBox()
                                        : RoundedButton(
                                            text: getTranslated(context,
                                                'home.reEnterManually'),
                                            backgroundColor:
                                                AppColor.primaryColor,
                                            margin: EdgeInsets.only(left: 24.w),
                                            onPressed: () =>
                                                Navigator.of(context).pop(),
                                          ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }
                    return SizedBox();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
