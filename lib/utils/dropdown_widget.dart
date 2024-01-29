import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DropdownWidget<T> extends StatelessWidget {
  final T dropdownValue;
  final String hint;
  final ValueChanged<T> onChanged;
  final List<T> items;

  const DropdownWidget(
      {Key key, this.dropdownValue, this.onChanged, this.items, this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: Colors.green, style: BorderStyle.solid, width: 0.80),
      ),
      child: DropdownButton<T>(
        borderRadius: BorderRadius.circular(25),
        hint: Text(
          hint,
        ),
        underline: const SizedBox(),
        isExpanded: true,
        value: dropdownValue,
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
      ),
    );
  }
}
