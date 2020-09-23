import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

Widget createTextField({
  String initialValue,
  FormFieldValidator<String> validator,
  FormFieldSetter<String> onSaved,
  ValueChanged<String> onChanged,
  bool autoValidate,
  String hintText,
  int maxLines,
  EdgeInsetsGeometry contentPadding,
  FocusNode focusNode,
  bool obscureText = false,
  TextInputType keyboardType,
  TextInputAction textInputAction,
  bool enabled = true,
  int maxLength,
}) {
  return TextFormField(
    initialValue: initialValue,
    enabled: enabled,
    focusNode: focusNode,
    autovalidate: autoValidate ?? false,
    validator: validator,
    onSaved: onSaved,
    onChanged: onChanged,
    maxLines: maxLines ?? 1,
    maxLength: maxLength,
    obscureText: obscureText,
    keyboardType: keyboardType,
    textInputAction: textInputAction,
    style: regularStyle,
    cursorColor: AppColor.dark,
    cursorWidth: 1.5,
    decoration: InputDecoration(
      hintText: hintText,
      filled: true,
      counter: const SizedBox(),
      fillColor: Colors.white,
      contentPadding: contentPadding ?? EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      errorStyle: regularStyle.merge(TextStyle(color: Colors.red, fontSize: 12.sp)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(color: AppColor.dark, width: 1),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(color: AppColor.dark, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(color: AppColor.dark, width: 1),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: const BorderSide(color: Colors.red, width: 1),
      ),
    ),
  );
}
