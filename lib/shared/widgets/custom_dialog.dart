import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class CustomDialog extends StatelessWidget {
  final String message;
  final Function onClose;

  const CustomDialog({
    Key key,
    this.message,
    this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        getTranslated(context, 'common.error'),
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24.sp),
      ),
      content: Text(
        message,
        style: regularStyle,
      ),
      actions: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
            onClose?.call();
          },
          child: Text(
            getTranslated(context, 'common.close'),
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24.sp, color: AppColor.primaryColor),
          ),
        )
      ],
    );
  }
}
