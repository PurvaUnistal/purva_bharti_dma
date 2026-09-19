import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:pbg_app/Utils/common_widgets/res/app_string.dart';
import 'input_decoration_style.dart';
import 'res/app_color.dart';
import 'button_widget.dart';
import 'res/common_style.dart';
import 'res/styles_widget.dart';

class DropDownSearchWidget<T> extends StatelessWidget {
  final List<T> items;
  final ValueChanged<dynamic>? onChanged;
  final DropdownSearchItemAsString<dynamic>? itemAsString;
  final String hint;
  final T? dropdownValue;
  final bool isRequired;
  final bool enabled;

  const DropDownSearchWidget({
    super.key,
    required this.items,
    this.onChanged,
    required this.itemAsString,
    required this.hint,
    this.dropdownValue,
    this.isRequired = false,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownSearch<T>(
      items: items,
      selectedItem: dropdownValue,
      enabled: enabled,
      itemAsString: itemAsString,
      onChanged: onChanged,

      /// ✅ FIXED: REMOVE unsafe compareFn
      compareFn: (item, selected) => item == selected,

      /// ✅ USE COMMON DECORATION
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecorationStyle.inputDecoration(
          context,
          labelText: hint,
          isRequired: isRequired,
        ).copyWith(
          fillColor: enabled ? Colors.white : Colors.grey.shade100,
        ),
      ),

      /// ✅ CLEAN POPUP
      popupProps: PopupProps.dialog(
        showSearchBox: true,

        searchFieldProps: TextFieldProps(
          decoration: InputDecorationStyle.inputDecoration(
            context,
            labelText: "Search",
          ),
        ),

        containerBuilder: (context, popupWidget) {
          return Column(
            children: [
              Expanded(child: popupWidget),

              /// Footer button
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: SizedBox(
                    width: 120,
                    child: ButtonWidget(
                   //   fontSize: AppFont.font_12,
                      onPressed: () => Navigator.pop(context),
                      text: "Cancel",
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}