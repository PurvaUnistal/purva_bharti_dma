import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String text;

  const ButtonWidget({Key? key, required this.onPressed, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.prime,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(
            width: 2,
            color:  AppColor.prime1,
          ),

        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
        child: Text(
          text,
          style: Styles.login,
        ),
      ),
    );
  }
}
