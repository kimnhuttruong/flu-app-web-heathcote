import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class RadioButtonWidget extends StatelessWidget {
  final String title;
  final bool isSelected;
  final EdgeInsets padding;
  final Function onTap;

  RadioButtonWidget({
    Key key,
    @required this.title,
    @required this.isSelected,
    this.onTap,
    this.padding,
  }) : super(key: key);

  Widget _buildSelectCircle() {
    return Container(
      width: 20.w,
      height: 20.w,
      decoration: BoxDecoration(
          shape: BoxShape.circle, border: Border.all(color: AppColor.dark)),
      alignment: Alignment.center,
      child: isSelected
          ? Container(
              width: 18.w,
              height: 18.w,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: AppColor.dark),
            )
          : SizedBox(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          onTap?.call();
        }
      },
      child: Padding(
        padding: padding ?? EdgeInsets.symmetric(vertical: 4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            _buildSelectCircle(),
            SizedBox(width: 12.w),
            Text(title, style: regularStyle)
          ],
        ),
      ),
    );
  }
}
