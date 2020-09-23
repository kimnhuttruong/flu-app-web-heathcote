import 'package:b13_flutter/core/blocs/user/bloc.dart';
import 'package:b13_flutter/core/repositories/configuration/configuration_repository.dart';
import 'package:b13_flutter/data/models/location.dart';
import 'package:b13_flutter/features/find_patient/screen/scan_barcode.dart';
import 'package:b13_flutter/features/welcome/bloc/location_bloc.dart';
import 'package:b13_flutter/features/welcome/bloc/location_event.dart';
import 'package:b13_flutter/features/welcome/bloc/location_state.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/widgets/custom_dialog.dart';
import 'package:b13_flutter/shared/widgets/drop_down_menu.dart';
import 'package:b13_flutter/shared/widgets/page_frame.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeScreen extends StatefulWidget {
  static const String route = '/welcome';

  WelcomeScreen({Key key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final ValueNotifier<DropDownItemModel> _locationNotifier =
      ValueNotifier(null);

  List<DropDownItemModel> _locatiomModel;
  Location _selectedLocation;

  // ignore: close_sinks
  LocationBloc _locationBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    _locationBloc = LocationBloc(
        configurationRepository:
            RepositoryProvider.of<ConfigurationRepository>(context))
      ..add(LoadLocationEvent());
    _userBloc = BlocProvider.of<UserBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _locationNotifier.dispose();
    super.dispose();
  }

  List<DropDownItemModel> _mapLocationsToDropDownModel(
      List<Location> locations) {
    return locations
        .asMap()
        .entries
        .map((entry) => DropDownItemModel(entry.key, entry.value.name))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserLoaded) {
          Navigator.of(context).pushReplacementNamed(ScanBarcodeScreen.route);
        }
      },
      child: BlocProvider.value(
        value: _locationBloc,
        child: PageFrameWidget(
          showCancelEntry: false,
          // padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 40.h),
          child: FractionallySizedBox(
            // widthFactor: 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: Text(
                    getTranslated(context, 'welcome.title'),
                    style: headerStyle,
                  ),
                ),
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    child: Text(
                      getTranslated(context, 'welcome.selectLocation'),
                      style: regularStyle,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    getTranslated(context, 'welcome.deliveryLocation'),
                    style: regularStyle,
                  ),
                ),
                Center(
                  child: FractionallySizedBox(
                    widthFactor: 0.55,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 30, bottom: 40.h),
                          child: Center(
                            child: BlocConsumer<LocationBloc, LocationState>(
                              listener: (context, state) {
                                if (state is LocationErrorState) {
                                  showDialog(
                                    context: context,
                                    builder: (context) =>
                                        CustomDialog(message: state.message),
                                  );
                                }
                              },
                              builder: (context, state) {
                                List<Location> locations;
                                if (state is LocationLoadedState) {
                                  locations = state.locations;
                                  _locatiomModel ??=
                                      _mapLocationsToDropDownModel(locations);
                                }
                                return DropDownMenuWidget(
                                  items: _locatiomModel ?? [],
                                  onSelectedItem: (item) {
                                    _locationNotifier.value = item;
                                    _selectedLocation = locations[item.index];
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                        ValueListenableBuilder(
                          valueListenable: _locationNotifier,
                          builder: (context, value, _) => RoundedButton(
                            text: getTranslated(context, 'welcome.start'),
                            onPressed: value != null
                                ? () {
                                    _userBloc.add(UpdateUserLocationEvent(
                                        _selectedLocation));
                                  }
                                : null,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
