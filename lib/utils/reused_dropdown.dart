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
      padding: const EdgeInsets.fromLTRB(24.0, 0.0, 24.0, 0.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(textLabel,style:TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1),
              ),
              child: DropdownButton<String>(
                items: items,
                value: value,
                hint: Text(hint,style: TextStyle(color: Colors.black,fontFamily: 'Montserrat',fontWeight: FontWeight.normal),),
                onChanged: onChanged,
                isExpanded: true,
                isDense: true,
              ),
            ),
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
      padding: const EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(textLabel, style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          DropdownButtonHideUnderline(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                border: Border.all(
                    color: Colors.grey, style: BorderStyle.solid, width: 1),
              ),
              child: DropdownButton<OptionItem>(
                items: items,
                value: value,
                hint: Text(hint,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.normal),
                ),
                onChanged: onChanged,
                isExpanded: true,
                isDense: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}