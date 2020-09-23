import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final TextStyle style;
  final Color backgroundColor;
  final EdgeInsetsGeometry margin;

  RoundedButton({
    @required this.text,
    this.onPressed,
    this.margin,
    this.style,
    this.backgroundColor,
  }) : assert(text != null, 'Text cant be null');

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      height: 54.h,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: AppColor.pine,
            blurRadius: 0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        elevation: 0,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 19.sp)
                .merge(style),
          ),
        ),
        color: backgroundColor ?? AppColor.fernGreen,
        disabledColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}
