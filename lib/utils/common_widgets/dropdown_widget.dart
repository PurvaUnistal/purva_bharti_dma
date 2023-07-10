import 'package:flutter/material.dart';

class DropDownWidget extends StatelessWidget {
  final String dropdownValue;
  final String hint;
  final ValueChanged<dynamic> onChanged;
  final List<DropdownMenuItem<dynamic>> items;

  const DropDownWidget({Key key,
    this.dropdownValue,
    this.onChanged,
    this.items,
    this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all( color: Colors.grey, style: BorderStyle.solid, width: 1),
        ),
        child: DropdownButton<dynamic>(
          hint: Text(hint),
          underline: SizedBox(),
          items: items,
          onChanged:onChanged,
          isExpanded: true,
          isDense: true,
        ),
      ),
    );
  }
}
