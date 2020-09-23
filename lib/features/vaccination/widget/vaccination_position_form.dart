import 'package:b13_flutter/data/models/batch.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_bloc.dart';
import 'package:b13_flutter/features/vaccination/bloc/batch_state.dart';
import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:b13_flutter/shared/widgets/app_text_field_form.dart';
import 'package:b13_flutter/shared/widgets/drop_down_menu.dart';
import 'package:b13_flutter/shared/widgets/radio_button.dart';
import 'package:b13_flutter/shared/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VaccinationPositionForm extends StatefulWidget {
  final Function(Batch batch, String vaccinPosition) onSubmit;

  VaccinationPositionForm({
    Key key,
    this.onSubmit,
  }) : super(key: key);

  @override
  _VaccinationLocationFormState createState() =>
      _VaccinationLocationFormState();
}

class _VaccinationLocationFormState extends State<VaccinationPositionForm> {
  final _formKey = GlobalKey<FormState>();

  List<DropDownItemModel> batchNumberModel;
  Batch selectedBatch;
  int selectedPosition;
  String otherPosition;

  Widget _buildOtherInput() => Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              width: 4,
              height: 70.h,
              color: AppColor.dark,
              margin: EdgeInsets.symmetric(horizontal: 16.w),
            ),
            Flexible(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                child: Form(
                  key: _formKey,
                  child: createTextField(
                    autoValidate: false,
                    initialValue: otherPosition,
                    maxLength: 50,
                    onChanged: (value) {
                      setState(() {
                        otherPosition = value;
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  bool _isEnable() {
    if (selectedBatch == null || selectedPosition == null) {
      return false;
    }
    if (selectedPosition == 2 &&
        (otherPosition == null || otherPosition.trim().isEmpty)) {
      return false;
    }
    return true;
  }

  String get getPositionDetail {
    if (selectedPosition == 0) {
      return getTranslated(context, 'home.leftArm');
    }
    if (selectedPosition == 1) {
      return getTranslated(context, 'home.rightArm');
    }
    return otherPosition.trim();
  }

  List<DropDownItemModel> _mapBatchesToDropDownModel(List<Batch> batches) {
    return batches
        .asMap()
        .entries
        .map((entry) => DropDownItemModel(entry.key, entry.value.batchNumber))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 24.h, bottom: 5.h),
          child: Text(
            getTranslated(context, 'home.batchNumber'),
            style: regularStyle,
          ),
        ),
        FractionallySizedBox(
          widthFactor: 0.7,
          child: BlocBuilder<BatchBloc, BatchState>(builder: (context, state) {
            List<Batch> batches;
            if (state is BatchLoadedState) {
              batches ??= state.batches;
              batchNumberModel ??= _mapBatchesToDropDownModel(state.batches);
            }
            return DropDownMenuWidget(
              items: batchNumberModel ?? [],
              onSelectedItem: (DropDownItemModel item) {
                setState(() {
                  selectedBatch = batches[item.index];
                });
              },
            );
          }),
        ),
        Padding(
          padding: EdgeInsets.only(top: 40.h, bottom: 10.h),
          child: Text(
            getTranslated(context, 'home.positionVaccination'),
            style: regularStyle,
          ),
        ),
        RadioButtonWidget(
          title: getTranslated(context, 'home.leftArm'),
          isSelected: selectedPosition == 0,
          onTap: () {
            setState(() {
              selectedPosition = 0;
            });
          },
        ),
        RadioButtonWidget(
          title: getTranslated(context, 'home.rightArm'),
          isSelected: selectedPosition == 1,
          onTap: () {
            setState(() {
              selectedPosition = 1;
            });
          },
        ),
        RadioButtonWidget(
          title: getTranslated(context, 'home.orther'),
          isSelected: selectedPosition == 2,
          onTap: () {
            setState(() {
              selectedPosition = 2;
            });
          },
        ),
        selectedPosition == 2 ? _buildOtherInput() : SizedBox(),
        RoundedButton(
          text: getTranslated(context, 'common.continue'),
          margin: EdgeInsets.only(top: 40.h, bottom: 5.h),
          onPressed: _isEnable()
              ? () {
                  widget.onSubmit(selectedBatch, getPositionDetail);
                }
              : null,
        )
      ],
    );
  }
}
