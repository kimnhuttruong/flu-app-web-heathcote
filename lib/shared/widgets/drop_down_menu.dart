import 'package:b13_flutter/localizations/localization_constants.dart';
import 'package:b13_flutter/shared/themes/app_theme.dart';
import 'package:b13_flutter/shared/themes/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:b13_flutter/shared/extensions/screen_extension.dart';
import 'package:b13_flutter/shared/extensions/string_extension.dart';

class DropDownItemModel {
  final int index;
  final String value;

  DropDownItemModel(this.index, this.value);
}

class DropDownMenuWidget extends StatefulWidget {
  final List<DropDownItemModel> items;
  final Function(DropDownItemModel value) onSelectedItem;
  final String initValue;

  DropDownMenuWidget({
    Key key,
    @required this.items,
    this.onSelectedItem,
    this.initValue,
  }) : super(key: key);

  @override
  _DropDownMenuWidgetState createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState<T> extends State<DropDownMenuWidget> {
  DropDownItemModel selectedItem;

  @override
  void initState() {
    _handleInitItem();
    super.initState();
  }

  void _handleInitItem() {
    if (widget.initValue.isNullOrEmpty) {
      return;
    }
    for (DropDownItemModel item in widget.items) {
      if (item.value == widget.initValue) {
        selectedItem = item;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      height: 60.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.dark, width: 1),
        borderRadius: BorderRadius.circular(5.w),
        gradient: LinearGradient(
          colors: [AppColor.softGrey, Colors.white],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: DropdownButton<DropDownItemModel>(
        value: selectedItem ?? null,
        hint: Text(
          getTranslated(context, 'common.select'),
          style: regularStyle,
        ),
        icon: kIsWeb
            ? Image.network(
                'assets/icons/drop-down.svg',
                width: 15.w,
                height: 15.w,
                color: AppColor.dark,
              )
            : SvgPicture.asset(
                'assets/icons/drop-down.svg',
                width: 15.w,
                height: 15.w,
                color: AppColor.dark,
              ),
        underline: const SizedBox(),
        style: regularStyle,
        isExpanded: true,
        items: widget.items
            .map<DropdownMenuItem<DropDownItemModel>>(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item.value ?? '',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
            .toList(),
        onChanged: (DropDownItemModel newValue) {
          setState(() {
            selectedItem = newValue;
          });
          widget.onSelectedItem(newValue);
        },
      ),
    );
  }
}
