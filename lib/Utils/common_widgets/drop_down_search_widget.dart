import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'input_decoration_style.dart';
import 'res/app_color.dart';
import 'button_widget.dart';
import 'res/common_style.dart';
import 'res/environment_config.dart';
import 'res/styles_widget.dart';

class DropDownSearchWidget<T> extends StatelessWidget {
  final List<T> items;
  final ValueChanged<T?>? onChanged;
  final DropdownSearchItemAsString<T>? itemAsString;
  final String hint;
  final String? label;
  final bool isRequired;
  final bool enabled;
  final T? dropdownValue;
  final DropdownSearchOnFind<String>? asyncItems;
  final DropdownSearchCompareFn<T>? compareFn;

  const DropDownSearchWidget({
    super.key,
    required this.items,
    this.onChanged,
    required this.itemAsString,
    required this.hint,
    this.isRequired = false,
    this.enabled = true,
    required this.label,
    this.dropdownValue,
    this.asyncItems,
    this.compareFn,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme
        .of(context)
        .brightness == Brightness.dark;
    final textColor = Theme
        .of(context)
        .colorScheme
        .onSurface; // ✅ auto light/dark
    final enabledFill = isDark
        ? Theme
        .of(context)
        .colorScheme
        .surfaceContainerHighest
        : Colors.white;
    final disabledFill = isDark
        ? Theme
        .of(context)
        .colorScheme
        .surfaceContainerHighest
        .withValues(alpha: 0.4)
        : Colors.grey.shade100;

    return SafeArea(
      child: DropdownSearch<T>(
        compareFn: compareFn ??
            (itemAsString != null
                ? (a, b) => itemAsString!(a) == itemAsString!(b)
                : null),
        decoratorProps: DropDownDecoratorProps(
          textAlign: TextAlign.start,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecorationStyle.inputDecoration(
            context,
            labelText: hint,
            isRequired: isRequired,
          ).copyWith(
            fillColor: enabled ? enabledFill : disabledFill, // ✅
          ),
        ),
        items: (filter, infiniteScrollProps) => items,
        itemAsString: itemAsString,
        onChanged: onChanged,
        selectedItem: dropdownValue,
        popupProps: PopupProps.bottomSheet(
            bottomSheetProps: BottomSheetProps(
                backgroundColor: AppColor.white,
                shape: LinearBorder.top(
          side: BorderSide(color: EnvironmentConfig.of(context)!.primaryTheme,)
          ),
          ),
            searchFieldProps: TextFieldProps(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: AppColor.white,
                  isDense: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  enabledBorder: CommonStyle.border(context: context),
                  disabledBorder: CommonStyle.border(context: context),
                  border: CommonStyle.border(context: context),
                  focusedBorder: CommonStyle.border(context: context),
                  errorBorder: CommonStyle.border(context: context),
                  label: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: label ?? '',
                          style: TextStyle(
                            color: textColor,
                            fontSize: 14,
                            fontWeight:  FontWeight.w500,
                          ),
                        ),
                        if (isRequired)
                          const TextSpan(
                            text: ' *',
                            style: TextStyle(color: Colors.red),
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
