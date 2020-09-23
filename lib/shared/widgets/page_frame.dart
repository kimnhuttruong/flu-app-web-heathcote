import 'package:b13_flutter/core/blocs/auth/bloc.dart';
import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/data/models/user.dart';
import 'package:b13_flutter/features/login/screen/sign_in.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';

class PageFrameWidget extends StatefulWidget {
  final Widget child;
  final Color backgroundColor;
  final bool showCancelEntry;
  final EdgeInsets padding;
  final Function onCancel;

  PageFrameWidget({
    Key key,
    @required this.child,
    this.backgroundColor = AppColor.paleGrey,
    this.showCancelEntry = true,
    this.padding,
    this.onCancel,
  }) : super(key: key);

  @override
  _PageFrameWidgetState createState() => _PageFrameWidgetState();
}

class _PageFrameWidgetState extends State<PageFrameWidget> {
  // ignore: close_sinks
  UserBloc _userBloc;
  AuthBloc _authBloc;
  User _currentUser;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
    _authBloc = BlocProvider.of<AuthBloc>(context);
    super.initState();
  }

  Widget _buttonLogout(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushReplacementNamed(SignInScreen.route);
        _authBloc.add(SignOutEvent());
      },
      borderRadius: BorderRadius.circular(4),
      child: Container(
        height: 44.h,
        width: 86.w,
        margin: EdgeInsets.only(left: 32.w),
        decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        alignment: Alignment.center,
        child: Text(
          getTranslated(context, 'common.logout'),
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil.statusBarHeight,
                color: AppColor.primaryColor,
              ),
              Container(
                height: 92.h,
                width: ScreenUtil.screenWidthDp,
                color: AppColor.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: BlocBuilder<UserBloc, UserState>(
                    bloc: _userBloc,
                    builder: (context, state) {
                      if (state is UserLoaded) {
                        _currentUser = state.user;
                      }
                      return Center(
                        child: Row(
                          children: <Widget>[
                            if (_currentUser == null) ...[
                              Expanded(child: SizedBox())
                            ],
                            Image.asset(
                              'assets/images/nhs.jpg',
                              width: 112.w,
                              height: 45.h,
                            ),
                            Container(
                              height: 59.h,
                              width: 274.w,
                              margin: EdgeInsets.symmetric(horizontal: 10.w),
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              color: Color.fromARGB(255, 26, 96, 158),
                              child: Image.asset(
                                  'assets/images/rotherham-app.png'),
                            ),
                            if (_currentUser != null) ...[
                              Expanded(
                                child: Text(
                                  _currentUser.email,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                  ),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                              _buttonLogout(context)
                            ] else ...[
                              Expanded(child: SizedBox())
                            ]
                          ],
                        ),
                      );
                    }),
              ),
              widget.showCancelEntry
                  ? Container(
                      height: 60.h,
                      width: ScreenUtil.screenWidthDp,
                      padding: EdgeInsets.symmetric(horizontal: 32.w),
                      color: Colors.white,
                      alignment: Alignment.centerLeft,
                      child: InkWell(
                        onTap: () {
                          if (widget.onCancel != null) {
                            widget.onCancel();
                          } else {
                            Navigator.of(context).pop();
                          }
                        },
                        child: SizedBox(
                          height: 60.h,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              getTranslated(context, 'common.cancelEntry'),
                              style: TextStyle(
                                fontSize: 19.sp,
                                color: AppColor.primaryColor,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(),
              Expanded(
                child: Container(
                  width: ScreenUtil.screenWidthDp,
                  color: widget.backgroundColor,
                  padding:
                      widget.padding ?? EdgeInsets.symmetric(horizontal: 32.w),
                  alignment: Alignment.topLeft,
                  child: widget.child,
                ),
              ),
              Container(
                height: 78.h,
                width: ScreenUtil.screenWidthDp,
                decoration: BoxDecoration(
                  color: AppColor.lightGrey,
                  border: Border(
                    top: BorderSide(color: AppColor.primaryColor, width: 4.h),
                  ),
                ),
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(horizontal: 45.w),
                child: Text(
                  '${String.fromCharCode(0x00A9)} Crown copyright',
                  style: TextStyle(
                      color: Color.fromARGB(255, 82, 98, 112), fontSize: 16.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
