import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class DropdownWidget<T> extends StatelessWidget {
  final dynamic dropdownValue;
  final String hint;
  final String? label;
  final String? star;
//  final ValueChanged<T?> onChanged;
  final void Function(dynamic)? onChanged;
  final List<dynamic> items;

   DropdownWidget({
    Key? key,
    required this.dropdownValue,
    required this.onChanged,
    required this.items,
    required this.hint,
    this.star,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<dynamic>(
        borderRadius: BorderRadius.circular(5),
        decoration: InputDecoration(
          fillColor: AppColor.white,
          isDense: false,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          enabledBorder: border,
          disabledBorder:  border,
          border:  border,
          focusedBorder: border,
          label: Padding(
            padding: const EdgeInsets.only(left: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: Text(star??"", style:Styles.stars)),
                Flexible(child: Text(label  ?? "", style:Styles.labels)),
              ],
            ),
          ),
        ),
        hint: Text(hint, style:Styles.labels),
        style: Styles.labels,
        isExpanded: true,
        value: dropdownValue != null ? dropdownValue : null,
        items: items.map<DropdownMenuItem<dynamic>>((dynamic value) {
          return DropdownMenuItem<dynamic>(
            value: value,
            child: Text(
              value.toString(),
              style: Styles.texts,
            ),
          );
        }).toList(),
        onChanged: onChanged
        );
  }

  OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(color: AppColor.green, style: BorderStyle.solid, width: 0.80),
  );
}
