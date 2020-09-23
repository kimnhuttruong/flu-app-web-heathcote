import 'package:b13_flutter/shared/utils/screen_utils.dart';

extension SizeExtension on num {
  num get w => ScreenUtil().setWidth(this);
  num get h => ScreenUtil().setHeight(this);
  num get sp => ScreenUtil().setSp(this);
}
