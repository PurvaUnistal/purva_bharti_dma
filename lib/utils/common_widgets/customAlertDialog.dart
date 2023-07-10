import 'package:flutter/material.dart';
import 'package:hpcl_app/ExportFile/export_file.dart';

class CustomAlertDialog{
  static alert({String imageFile, BuildContext context }) {
    return AlertDialog(
      title: Text("HPCL DMA"),
      content: Image.file(File(imageFile)),
      actions: [
        TextButton(
          child: Text("OK"),
          onPressed: () {
            Navigator.pop(context, false);
          },
        )
      ],
    );
  }
}
