import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class BorderWidget extends StatelessWidget {
  final List<Widget> children;
  const BorderWidget({Key? key, required this.children}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding: EdgeInsets.all(5),
      child:  Column(
        children: children,
      ),
      decoration: BoxDecoration(
        //  color: Colors.grey[200],
          border: Border.all(
            color: AppColor.black,
            width: 0.9,
          )),
    );
  }
}