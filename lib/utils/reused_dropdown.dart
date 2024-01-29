import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0, right: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              textLabel,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 10),
            ),
          ),
          DropdownButtonFormField(
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.normal,
                fontSize: 10),
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.green),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.grey),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.green),
              ),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(
                    width: 1,
                  )),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red)),
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            ),
            items: items,
            value: value,
            hint: Text(
              hint,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 10),
            ),
            onChanged: onChanged,
            isExpanded: true,
            isDense: false,
            iconEnabledColor: Colors.green,
          ),
        ],
      ),
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
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 5, right: 12),
      child: Column(children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            textLabel,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ),
        DropdownButtonFormField(
          isDense: false,
          iconEnabledColor: Colors.green,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 10),
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.green),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              borderSide: BorderSide(width: 1, color: Colors.green),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(
                  width: 1,
                )),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                borderSide: BorderSide(width: 1, color: Colors.red)),
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
            //   contentPadding: EdgeInsets.only(right: 2),
          ),
          items: items,
          value: value,
          hint: Text(
            hint,
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.normal,
                fontSize: 10),
          ),
          onChanged: onChanged,
          isExpanded: true,
        ),
      ]),
    );
  }
}
