import 'package:b13_flutter/data/models/gp_practice.dart';
import 'package:b13_flutter/data/remote/model/search_patient.dart';
import 'package:b13_flutter/features/find_patient/screen/patient_manual_input/bloc/gp_practice_bloc.dart';
import 'package:b13_flutter/features/find_patient/screen/patient_manual_input/bloc/gp_practice_state.dart';
import 'package:b13_flutter/features/patient_detail/screen/patient_detail.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/widgets/app_text_field_form.dart';
import 'package:b13_flutter/shared/widgets/drop_down_menu.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:b13_flutter/shared/extensions/string_extension.dart';

class ManualSearchForm extends StatefulWidget {
  const ManualSearchForm({
    Key key,
  }) : super(key: key);

  @override
  ManualSearchFormState createState() => ManualSearchFormState();
}

class ManualSearchFormState extends State<ManualSearchForm> {
  final _formKey = GlobalKey<FormState>();
  List<DropDownItemModel> gpPracticesModel;
  SearchPatient _searchData = SearchPatient();

  final validator = SearchPatientValidator();

  bool validateInputData() {
    FocusScope.of(context).unfocus();
    final form = _formKey.currentState;
    return form.validate();
  }

  List<DropDownItemModel> _mapGpToDropDownModel(List<GpPractice> gpPractices) {
    return gpPractices
        .asMap()
        .entries
        .map((entry) => DropDownItemModel(entry.key, entry.value.name))
        .toList();
  }

  bool _isFilled() {
    if (_searchData.firstName.isNullOrEmpty ||
        _searchData.surname.isNullOrEmpty ||
        _searchData.day.isNullOrEmpty ||
        _searchData.month.isNullOrEmpty ||
        _searchData.year.isNullOrEmpty ||
        _searchData.gpPractice.isNullOrEmpty ||
        _searchData.orgCode.isNullOrEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Center(
        child: FractionallySizedBox(
          widthFactor: 0.55,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
                child: Text(
                  getTranslated(context, 'home.firstName'),
                  style: regularStyle,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.55,
                child: createTextField(
                  autoValidate: false,
                  maxLength: 30,
                  onChanged: (value) {
                    setState(() {
                      _searchData..firstName = value;
                    });
                  },
                  validator: validator.validateFirstName,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
                child: Text(
                  getTranslated(context, 'home.surname'),
                  style: regularStyle,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.55,
                child: createTextField(
                  autoValidate: false,
                  maxLength: 30,
                  onChanged: (value) {
                    setState(() {
                      _searchData..surname = value;
                    });
                  },
                  validator: validator.validateSurname,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Text(
                  getTranslated(context, 'home.dateOfBirth'),
                  style: regularStyle,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 10.w),
                child: Text(
                  getTranslated(context, 'home.birthdayExample'),
                  style: TextStyle(fontSize: 19.sp, color: Colors.grey),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                          getTranslated(context, 'home.day'),
                          style: regularStyle,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: createTextField(
                          autoValidate: false,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _searchData..day = value;
                            });
                          },
                          validator: validator.validateDay,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                          getTranslated(context, 'home.month'),
                          style: regularStyle,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: createTextField(
                          autoValidate: false,
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _searchData..month = value;
                            });
                          },
                          validator: validator.validateMonth,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.h),
                        child: Text(
                          getTranslated(context, 'home.year'),
                          style: regularStyle,
                        ),
                      ),
                      SizedBox(
                        width: 130,
                        child: createTextField(
                          autoValidate: false,
                          maxLength: 4,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              _searchData..year = value;
                            });
                          },
                          validator: validator.validateYear,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
                child: Text(
                  getTranslated(context, 'home.gp'),
                  style: regularStyle,
                ),
              ),
              FractionallySizedBox(
                widthFactor: 0.7,
                child: BlocBuilder<GpPracticeBloc, GpPracticeState>(
                  builder: (context, state) {
                    List<GpPractice> gpPractices;
                    if (state is GpPracticeLoadedState) {
                      gpPractices = state.gpPractices;
                      gpPracticesModel ??=
                          _mapGpToDropDownModel(state.gpPractices);
                    }
                    return Container(
                      height: 50,
                      child: DropDownMenuWidget(
                        items: gpPracticesModel ?? [],
                        initValue: gpPracticesModel?.first?.value,
                        onSelectedItem: (DropDownItemModel item) {
                          FocusScope.of(context).unfocus();
                          setState(() {
                            _searchData
                              ..gpPractice = item.value
                              ..orgCode = gpPractices[item.index].code;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                children: <Widget>[
                  RoundedButton(
                    text: getTranslated(context, 'home.search'),
                    onPressed: _isFilled()
                        ? () {
                            if (validateInputData()) {
                              Navigator.of(context).pushNamed(
                                  PatientDetailScreen.route,
                                  arguments: {
                                    'searchPatient': _searchData,
                                  });
                            }
                          }
                        : null,
                  ),
                  RoundedButton(
                    text: getTranslated(context, 'home.scanBarcode'),
                    backgroundColor: AppColor.primaryColor,
                    margin: EdgeInsets.only(left: 24.w),
                    onPressed: () => Navigator.of(context).pop(),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
