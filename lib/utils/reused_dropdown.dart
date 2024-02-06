import 'package:flutter/material.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';
import 'package:pbg_app/utils/common_widgets/app_style.dart';
import '../../ExportFile/export_file.dart';

class ReusedDropDownString extends StatelessWidget {
  final String hint, textLabel;
  final List<DropdownMenuItem<String>> items;
  final String value;
  final Function(String) onChanged;
  const ReusedDropDownString(
      {Key key,
        this.hint,
        this.value,
        this.onChanged,
        this.items,
        this.textLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(textLabel, style: AppStyle.styleB(),),
        ),
        _vertical(context),
        DropdownButtonFormField(
          style: AppStyle.styleN(),
          items: items,
          value: value,
          hint: Text(hint, style: AppStyle.styleN(),),
          onChanged: onChanged,
          isExpanded: true,
          isDense: false,
          iconEnabledColor: AppColor.green,
          decoration: InputDecoration(
            focusedBorder: AppStyle.border(color: AppColor.green),
            disabledBorder: AppStyle.border(color: AppColor.grey),
            enabledBorder: AppStyle.border(color: AppColor.green),
            border: AppStyle.border(color: AppColor.green),
            errorBorder: AppStyle.border(color: AppColor.red),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
          ),
        ),
      ],
    );
  }
}

class ReusedDropDownOptionItem extends StatelessWidget {
  final String hint, textLabel;
  final List<DropdownMenuItem<OptionItem>> items;
  final OptionItem value;
  final Function(OptionItem) onChanged;
  const ReusedDropDownOptionItem(
      {Key key,
        this.hint,
        this.value,
        this.onChanged,
        this.items,
        this.textLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(textLabel, style:  AppStyle.styleB()),
          ),
          _vertical(context),
          DropdownButtonFormField(
            items: items,
            value: value,
            hint: Text(hint, style: AppStyle.styleN()),
            onChanged: onChanged,
            isExpanded: true,
            isDense: false,
            iconEnabledColor: Colors.green,
            style: AppStyle.styleN(),
            decoration: InputDecoration(
              focusedBorder: AppStyle.border(color: Colors.green),
              disabledBorder: AppStyle.border(color: Colors.grey),
              enabledBorder: AppStyle.border(color: Colors.green),
              border: AppStyle.border(color: Colors.green),
              errorBorder: AppStyle.border(color: Colors.red),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
          ),
        ]);
  }



}
_vertical(BuildContext context){
  return SizedBox(
    height: MediaQuery.of(context).size.height *0.002,
  );
}