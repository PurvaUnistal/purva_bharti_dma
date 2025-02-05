import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'common_widgets/app_color.dart';
import 'common_widgets/app_style.dart';

class DropdownWidget<T> extends StatelessWidget {
  final T dropdownValue;
  final String hint;
  final String labelText;
  final ValueChanged<T> onChanged;
  final List<T> items;

  const DropdownWidget(
      {Key key, this.dropdownValue,this.labelText, this.onChanged, this.items, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(

      decoration: InputDecoration(
        focusedBorder: AppStyle.border(color: AppColor.black),
        disabledBorder: AppStyle.border(color: AppColor.grey),
        enabledBorder: AppStyle.border(color: AppColor.black),
        border: AppStyle.border(color: AppColor.black),
        errorBorder:AppStyle.border(color: AppColor.red),
        hintText: hint,
        hintStyle:AppStyle.styleB(),
        labelText: labelText,
        labelStyle: AppStyle.styleB(),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      ),
      isExpanded: true,
      value: dropdownValue,
      style: AppStyle.styleN(),
      items: items.map<DropdownMenuItem<T>>((T value) {
        return DropdownMenuItem<T>(

          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
      onChanged: (value) {
        if (kDebugMode) {
          log("${value.runtimeType} SELECTED_VALUE ---> ${value.toString()}");
        }
        onChanged(value);
      },
    );
  }
}
