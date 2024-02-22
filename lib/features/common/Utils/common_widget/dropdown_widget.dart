import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class DropdownWidget<T> extends StatelessWidget {
  final T? dropdownValue;
  final String hint;
  final String? label;
//  final ValueChanged<T?> onChanged;
  final void Function(T?)? onChanged;
  final List<T> items;

  const DropdownWidget({
    Key? key,
    required this.dropdownValue,
    required this.onChanged,
    required this.items,
    required this.hint,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
        borderRadius: BorderRadius.circular(5),
        decoration: InputDecoration(
          fillColor: AppColor.white,
          // labelText: label,
          isDense: false,
          contentPadding: const EdgeInsets.symmetric(horizontal: 5.0),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.green, style: BorderStyle.solid, width: 0.80),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.green, style: BorderStyle.solid, width: 0.80),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.green, style: BorderStyle.solid, width: 0.80),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
            borderSide: BorderSide(color: AppColor.green, style: BorderStyle.solid, width: 0.80),
          ),

          // label: label!,
          label: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              label  ?? "",
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
            ),
          ),
          /*filled: true,
          labelText: 'Occupation',
          border: OutlineInputBorder(
            borderRadius: const BorderRadius.all(
              const Radius.circular(30.0),
            ),
          ),*/
        ),
        hint: Text(
          hint,
          style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
        ),
        style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black),
        isExpanded: true,
        value: dropdownValue != null ? dropdownValue : null,
        items: items.map<DropdownMenuItem<T>>((T value) {
          return DropdownMenuItem<T>(
            value: value,
            child: Text(
              value.toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          );
        }).toList(),
        onChanged: onChanged
        /*onChanged: (value) {
        if (kDebugMode) {
          log("${value.runtimeType} SELECTED_VALUE ---> ${value.toString()}");
        }
        onChanged!(value!);
      },*/
        );
  }
}
