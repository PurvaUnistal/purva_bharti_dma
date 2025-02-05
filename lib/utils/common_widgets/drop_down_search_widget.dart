import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';
import 'app_style.dart';

class DropDownSearchWidget extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged<dynamic> onChanged;
  final DropdownSearchItemAsString<dynamic> itemAsString;
  final String hint;
  final String labelText;
  final String star;
  final dynamic dropdownValue;
  final DropdownSearchOnFind<String> asyncItems;

  const DropDownSearchWidget({
    this.items,
    this.onChanged,
    this.itemAsString,
    this.hint,
    this.star,
    this.labelText,
    this.dropdownValue,
    this.asyncItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.06,
      child: DropdownSearch<dynamic>(
        showSearchBox: true,
        mode: Mode.BOTTOM_SHEET,
        dropdownSearchDecoration: InputDecoration(
            filled: true,
            fillColor: AppColor.white,
            isDense: true,
            focusedBorder: AppStyle.border(color: AppColor.black),
            disabledBorder: AppStyle.border(color: AppColor.grey),
            enabledBorder: AppStyle.border(color: AppColor.black),
            border: AppStyle.border(color: AppColor.black),
            errorBorder: AppStyle.border(color: AppColor.red),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
            hintText: hint,
            hintStyle: AppStyle.styleB()),
        searchBoxDecoration: InputDecoration(
            filled: true,
            fillColor: AppColor.white,
            isDense: true,
            focusedBorder: AppStyle.border(color: AppColor.black),
            disabledBorder: AppStyle.border(color: AppColor.grey),
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
            )),
        items: items,
        itemAsString: itemAsString,
        onChanged: onChanged,
        selectedItem: dropdownValue,

        dropdownButtonBuilder: (_) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: const Icon(
            Icons.arrow_drop_down,
            size: 24,
            color: Colors.black,
          ),
        ),
        popupShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
      ),
    );
  }
}
