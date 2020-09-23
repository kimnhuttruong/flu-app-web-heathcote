import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/data/remote/model/login_user.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/widgets/app_text_field_form.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:b13_flutter/shared/extensions/string_extension.dart';

class SignInForm extends StatefulWidget {
  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _formKey = GlobalKey<FormState>();
  final _data = LoginUser();
  UserBloc _userBloc;
  LoginUserValidator _validator = LoginUserValidator();
  String email;
  String password;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
  }

  bool get _isFilled =>
      !_data.email.isNullOrEmpty && !_data.password.isNullOrEmpty;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
            child: Text(
              getTranslated(context, 'login.email'),
              style: regularStyle,
            ),
          ),
          createTextField(
            autoValidate: false,
            keyboardType: TextInputType.emailAddress,
            validator: _validator.validateEmail,
            onChanged: (String value) {
              setState(() {
                _data.email = value;
              });
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
            child: Text(
              getTranslated(context, 'login.password'),
              style: regularStyle,
            ),
          ),
          createTextField(
            obscureText: true,
            autoValidate: false,
            onChanged: (String value) {
              setState(() {
                _data.password = value;
              });
            },
            validator: _validator.validatePassword,
          ),
          Center(
            child: RoundedButton(
              margin: EdgeInsets.only(top: 32.h),
              text: getTranslated(context, 'login.login'),
              onPressed: _isFilled ? _signIn : null,
            ),
          ),
        ],
      ),
    );
  }

  void _signIn() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      FocusScope.of(context).unfocus();
      _userBloc.add(SignInEmailEvent(user: _data));
    }
  }
}
