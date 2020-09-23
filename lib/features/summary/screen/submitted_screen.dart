import 'package:b13_flutter/features/find_patient/screen/scan_barcode.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class SubmittedRecordScreen extends StatelessWidget {
  static const String route = '/submitted-record';

  const SubmittedRecordScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PageFrameWidget(
      showCancelEntry: false,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 40.h),
            child: Text(
              getTranslated(context, 'home.entrySubmitted'),
              style: headerStyle,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.h),
            child: Text(
              getTranslated(context, 'home.submittedDescription'),
              style: regularStyle,
            ),
          ),
          RoundedButton(
            text: getTranslated(context, 'common.nextPatient'),
            backgroundColor: AppColor.fernGreen,
            onPressed: () => Navigator.of(context).pushNamedAndRemoveUntil(
                ScanBarcodeScreen.route, (route) => route is ScanBarcodeScreen),
          ),
        ],
      ),
    );
  }
}
