import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/features/find_patient/screen/patient_manual_input/bloc/gp_practice_state.dart';
import 'package:b13_flutter/features/find_patient/screen/patient_manual_input/widget/manual_search_form.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/widgets/custom_dialog.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

import 'bloc/gp_practice_bloc.dart';
import 'bloc/gp_practice_event.dart';

class PatientManualInputScreen extends StatelessWidget {
  static const String route = '/patient-manual-input';

  PatientManualInputScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageFrameWidget(
      child: KeyboardAvoider(
        autoScroll: true,
        child: SingleChildScrollView(
          child: BlocProvider<GpPracticeBloc>(
            create: (context) => GpPracticeBloc(
                configurationRepository:
                    RepositoryProvider.of<ConfigurationRepository>(context))
              ..add(LoadGpPracticeEvent()),
            child: BlocListener<GpPracticeBloc, GpPracticeState>(
              listener: (_, state) {
                if (state is GpPracticeErrorState) {
                  showDialog(
                    context: context,
                    builder: (context) => CustomDialog(message: state.message),
                  );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 40.h),
                    child: Text(
                      getTranslated(context, 'home.findPatient'),
                      style: headerStyle,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      getTranslated(context, 'home.enterManuallyFind'),
                      style: regularStyle,
                    ),
                  ),
                  ManualSearchForm(),
                  SizedBox(height: 32.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
