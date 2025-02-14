import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'app_color.dart';
import 'button_widget.dart';
import 'common_style.dart';
import 'styles_widget.dart';

class DropDownSearchWidget extends StatelessWidget {
  final List<dynamic> items;
  final ValueChanged<dynamic>? onChanged;
  final DropdownSearchItemAsString<dynamic>? itemAsString;
  final String hint;
  final String? label;
  final String? star;
  final dynamic dropdownValue;
  final DropdownSearchOnFind<String>? asyncItems;

  const DropDownSearchWidget({
    super.key,
    required this.items,
    this.onChanged,
    required this.itemAsString,
    required this.hint,
    this.star,
    required this.label,
    this.dropdownValue,
    this.asyncItems,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: DropdownSearch<dynamic>(
        dropdownDecoratorProps: DropDownDecoratorProps(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: AppColor.white,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              enabledBorder: CommonStyle.border,
              disabledBorder: CommonStyle.border,
              border: CommonStyle.border,
              focusedBorder: CommonStyle.border,
              errorBorder: CommonStyle.border,
              label: Padding(
                padding: const EdgeInsets.only(left: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Flexible(child: Text(star ?? "", style: Styles.stars)),
                    Flexible(
                      child: Text(label ?? "", style: Styles.labels),
                    ),
                  ],
                ),
              ),
              hintText: hint,
              hintStyle: Styles.labels),
        ),
        items: items,
        itemAsString: itemAsString,
        onChanged: onChanged,
        selectedItem: dropdownValue,
        popupProps: PopupProps.bottomSheet(
            bottomSheetProps: BottomSheetProps(
                backgroundColor: AppColor.white,
                shape: LinearBorder.top(
    side: BorderSide(color: AppColor.prime)
    ),
    ),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  enabledBorder: CommonStyle.border,
                  disabledBorder: CommonStyle.border,
                  border: CommonStyle.border,
                  focusedBorder: CommonStyle.border,
                  errorBorder: CommonStyle.border,
                  label: Padding(
                    padding: const EdgeInsets.only(left: 2.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(child: Text(star ?? "", style: Styles.stars)),
                        Flexible(
                          child: Text(label ?? "", style: Styles.labels),
                        ),
                      ],
                    ),
                  ),
                  hintText: hint,
                  hintStyle: Styles.labels),
            ),
            showSearchBox: true,
            containerBuilder: (context, popupWidget) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(child: popupWidget),
                    Align(
                      alignment: Alignment.centerRight,
                      child: ButtonWidget(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        text: "Cancel",
                      ),
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
