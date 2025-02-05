import 'package:flutter/material.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';
import 'package:pbg_app/utils/common_widgets/app_style.dart';
import '../../ExportFile/export_file.dart';

class ReusedDropDownString extends StatelessWidget {
  final String hint, labelText, star;
  final List<DropdownMenuItem<String>> items;
  final String value;
  final Function(String) onChanged;

  const ReusedDropDownString(
      {Key key,
      this.star,
      this.hint,
      this.value,
      this.onChanged,
      this.items,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      style: AppStyle.styleN(),
      items: items,
      value: value,
      onChanged: onChanged,
      isExpanded: true,
      isDense: true,
      iconEnabledColor: AppColor.black,
      decoration: InputDecoration(
        focusedBorder: AppStyle.border(color: AppColor.black),
        disabledBorder: AppStyle.border(color: AppColor.black),
        enabledBorder: AppStyle.border(color: AppColor.black),
        border: AppStyle.border(color: AppColor.black),
        errorBorder: AppStyle.border(color: AppColor.red),
        hintText: hint,
        hintStyle: AppStyle.styleB(),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(child: Text(star ?? "", style: AppStyle.styleAlter())),
            Flexible(
              child: Text(labelText ?? "", style: AppStyle.styleB()),
            ),
          ],
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
      ),
    );
  }
}

class ReusedDropDownOptionItem extends StatelessWidget {
  final String hint, labelText, star;
  final List<DropdownMenuItem<OptionItem>> items;
  final OptionItem value;
  final Function(OptionItem) onChanged;

  const ReusedDropDownOptionItem(
      {Key key,
      this.hint,
      this.star,
      this.value,
      this.onChanged,
      this.items,
      this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
        style: AppStyle.styleN(),
        items: items,
        value: value,
        onChanged: onChanged,
        isExpanded: true,
        isDense: true,
        decoration: InputDecoration(
          focusedBorder: AppStyle.border(color: AppColor.black),
          disabledBorder: AppStyle.border(color: AppColor.black),
          enabledBorder: AppStyle.border(color: AppColor.black),
          border: AppStyle.border(color: AppColor.black),
          errorBorder: AppStyle.border(color: AppColor.red),
          hintText: hint,
          hintStyle: AppStyle.styleB(),
          label: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(child: Text(star ?? "", style: AppStyle.styleAlter())),
              Flexible(
                child: Text(labelText ?? "", style: AppStyle.styleB()),
              ),
            ],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        ));
  }
}

_vertical(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.002,
  );
}
