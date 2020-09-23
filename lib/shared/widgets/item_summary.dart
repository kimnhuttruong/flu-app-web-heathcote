import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class ItemSummaryWidget extends StatelessWidget {
  final String label;
  final String content;
  final String action;
  final Function onTapAction;

  ItemSummaryWidget({
    Key key,
    @required this.label,
    @required this.content,
    this.action,
    this.onTapAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.lightGrey, width: 1),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Text(
              label,
              style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold, color: AppColor.dark2),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    content,
                    style: TextStyle(fontSize: 19.sp, color: AppColor.dark2),
                  ),
                ),
                onTapAction != null
                    ? InkWell(
                        onTap: onTapAction,
                        child: Text(
                          action ?? getTranslated(context, 'common.change'),
                          style: regularStyle.merge(
                            TextStyle(
                              color: AppColor.primaryColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
