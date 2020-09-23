import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/features/login/widget/signin_form.dart';
import 'package:b13_flutter/features/welcome/screen/welcome.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';

class SignInScreen extends StatelessWidget {
  static const String route = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          Navigator.of(context).pushReplacementNamed(WelcomeScreen.route);
        }
      },
      builder: (context, state) => Stack(
        children: [
          PageFrameWidget(
            showCancelEntry: false,
            child: KeyboardAvoider(
              autoScroll: true,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.h),
                      child: Text(
                        getTranslated(context, 'appname'),
                        style: headerStyle,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Text(
                        getTranslated(context, 'login.intro'),
                        style: regularStyle,
                      ),
                    ),
                  ),
                  Center(
                    child: FractionallySizedBox(
                      widthFactor: 0.55,
                      child: SignInForm(),
                    ),
                  ),
                  if (state is UserError)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.h),
                      child: Text(
                        state.message,
                        style: regularStyle.copyWith(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if (state is UserLoading)
            Container(
              color: Colors.black.withOpacity(0.2),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
        ],
      ),
    );
  }
}
