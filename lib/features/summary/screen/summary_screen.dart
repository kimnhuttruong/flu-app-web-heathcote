import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/core/repositories/patient/patient_repository.dart';
import 'package:b13_flutter/data/models/batch.dart';
import 'package:b13_flutter/data/models/patient.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/data/remote/model/request/submit_record_request.dart';
import 'package:b13_flutter/features/summary/bloc/submit_record_bloc.dart';
import 'package:b13_flutter/features/summary/bloc/submit_record_event.dart';
import 'package:b13_flutter/features/summary/bloc/submit_record_state.dart';
import 'package:b13_flutter/features/summary/screen/submitted_screen.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/widgets/custom_dialog.dart';
import 'package:b13_flutter/shared/widgets/item_summary.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class SummaryScreen extends StatefulWidget {
  static const String route = '/summary';
  final Batch batch;
  final String vacciPosition;
  final Patient patient;

  SummaryScreen({
    Key key,
    this.batch,
    this.vacciPosition,
    this.patient,
  }) : super(key: key);

  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  SubmitRecordBloc _submitRecordBloc;
  // ignore: close_sinks
  UserBloc _userBloc;
  User _user;

  @override
  void initState() {
    _submitRecordBloc =
        SubmitRecordBloc(patientRepository: RepositoryProvider.of<PatientRepository>(context));
    _userBloc = BlocProvider.of<UserBloc>(context);
    if (_userBloc.state is UserLoaded) {
      _user = (_userBloc.state as UserLoaded).user;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _submitRecordBloc,
      child: BlocConsumer<SubmitRecordBloc, SubmitRecordState>(
        listener: (context, state) {
          if (state is SubmittedRecordState) {
            Navigator.of(context).pushNamed(SubmittedRecordScreen.route);
          }
          if (state is SubmitRecordErrorState) {
            showDialog(
              context: context,
              builder: (context) => CustomDialog(message: state.message),
            );
          }
        },
        builder: (context, state) => Stack(
          children: [
            PageFrameWidget(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Text(
                        getTranslated(context, 'home.summary'),
                        style: headerStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(
                        getTranslated(context, 'home.confirmSummary'),
                        style: regularStyle,
                      ),
                    ),
                    ItemSummaryWidget(
                      content: widget.patient.displayName,
                      label: getTranslated(context, 'home.name'),
                    ),
                    ItemSummaryWidget(
                      content: widget.patient.birthDateFormatted,
                      label: getTranslated(context, 'home.dateOfBirth'),
                    ),
                    ItemSummaryWidget(
                      content: widget.patient?.gpPractice ?? '',
                      label: getTranslated(context, 'home.gp'),
                    ),
                    ItemSummaryWidget(
                      content: _user?.location?.name ?? '',
                      label: getTranslated(context, 'welcome.deliveryLocation'),
                    ),
                    ItemSummaryWidget(
                      content: widget.batch.batchNumber,
                      label: getTranslated(context, 'home.batchNumber'),
                      onTapAction: () => Navigator.of(context).pop(),
                    ),
                    ItemSummaryWidget(
                      content: widget.vacciPosition,
                      label: getTranslated(context, 'home.locationBody'),
                      onTapAction: () => Navigator.of(context).pop(),
                    ),
                    RoundedButton(
                      text: getTranslated(context, 'common.submitRecord'),
                      backgroundColor: AppColor.fernGreen,
                      margin: EdgeInsets.symmetric(vertical: 32.h),
                      onPressed: () => _submitRecordBloc.add(SubmitRecordRequestEvent(
                          SubmitRecordRequest(
                              batchId: widget.batch.id,
                              patientPhoneNumber: widget.patient.mobilePhoneNumber,
                              nhsId: widget.patient.nhsId,
                              orgId: 'Z99990'))),
                    ),
                  ],
                ),
              ),
            ),
            if (state is SubmittingRecordState)
              Container(
                color: Colors.black.withOpacity(0.2),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              )
          ],
        ),
      ),
    );
  }
}
