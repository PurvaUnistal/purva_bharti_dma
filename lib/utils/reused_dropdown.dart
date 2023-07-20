import 'package:flutter/material.dart';
import '../../ExportFile/export_file.dart';

class ReusedDropDownString extends StatelessWidget {
  final String hint,textLabel;
  final List<DropdownMenuItem<String>> items;
  final String value;
  final Function(String) onChanged;
  const ReusedDropDownString({Key key, this.hint, this.value,this.onChanged, this.items, this.textLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0,right: 12),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(textLabel,style:TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
          DropdownButtonFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.symmetric(horizontal: 10),
            ),
            items: items,
            value: value,
            hint: Text(hint,
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.normal,
                  fontSize: 12
              ),
            ),
            onChanged: onChanged,
            isExpanded: true,
            isDense: true,
          ),
        ],
      ),
    );
  }
}




class ReusedDropDownOptionItem extends StatelessWidget {
  final String hint,textLabel;
  final List<DropdownMenuItem<OptionItem>> items;
  final OptionItem value;
  final Function(OptionItem) onChanged;
  const ReusedDropDownOptionItem({Key key, this.hint, this.value,this.onChanged, this.items, this.textLabel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.only(top: 8, left: 12, bottom: 0,right: 12),
      child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Text(textLabel, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 12),
              ),
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
              ),
              items: items,
              value: value,
              hint: Text(hint,
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.normal,
                    fontSize: 12
                ),
              ),
              onChanged: onChanged,
              isExpanded: true,
              isDense: true,
            ),
          ]),
    );
  }
}