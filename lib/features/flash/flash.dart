import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/features/find_patient/screen/scan_barcode.dart';
import 'package:b13_flutter/features/login/screen/sign_in.dart';
import 'package:b13_flutter/features/welcome/screen/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashScreen extends StatefulWidget {
  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<FlashScreen> {
  UserBloc _userBloc;
  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _userBloc.listen((state) {
        if (mounted) {
          if (state is UserLoaded) {
            Navigator.of(context).pushReplacementNamed(WelcomeScreen.route);
          } else if (state is UserUninitialized) {
            Navigator.of(context).pushReplacementNamed(SignInScreen.route);
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
