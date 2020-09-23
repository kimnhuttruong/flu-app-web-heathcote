import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/data/models/patient.dart';
import 'package:b13_flutter/features/summary/screen/summary_screen.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_bloc.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_event.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_state.dart';
import 'package:b13_flutter/features/vaccination/widget/vaccination_position_form.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/widgets/custom_dialog.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VaccinationScreen extends StatelessWidget {
  static const String route = '/vaccination';
  final Patient patient;

  VaccinationScreen({
    Key key,
    this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BatchBloc>(
      create: (context) => BatchBloc(
          configurationRepository:
              RepositoryProvider.of<ConfigurationRepository>(context))
        ..add(LoadBatchEvent()),
      child: BlocListener<BatchBloc, BatchState>(
        listener: (context, state) {
          if (state is BatchErrorState) {
            showDialog(
              context: context,
              builder: (context) => CustomDialog(message: state.message),
            );
          }
        },
        child: PageFrameWidget(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Text(
                      getTranslated(context, 'home.vaccinationDetail'),
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      getTranslated(context, 'home.selectBatch'),
                      style: regularStyle,
                    ),
                  ),
                  VaccinationPositionForm(
                    onSubmit: (batch, vaccinPosition) =>
                        Navigator.of(context).pushNamed(
                      SummaryScreen.route,
                      arguments: {
                        'batch': batch,
                        'vacciPosition': vaccinPosition,
                        'patient': patient,
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
