import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class Utils {
  static Future<void> successSnackBar(
      {required String msg, required BuildContext context}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(msg)),
            Icon(Icons.check_circle, color: AppColor.white, size: 36),
          ],
        ),
        backgroundColor: Colors.green,
        padding: const EdgeInsets.all(8),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Future<void> warningSnackBar(
      {required String msg, required BuildContext context}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(msg)),
            Icon(Icons.warning_amber_rounded, color: AppColor.white, size: 36),
          ],
        ),
        backgroundColor: Colors.orangeAccent.shade200,
        padding: const EdgeInsets.all(8),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  static Future<void> errorSnackBar(
      {required String msg, required BuildContext context}) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(child: Text(msg)),
            IconButton(
                icon: Icon(
                  Icons.clear,
                  color: AppColor.white,
                  size: 36,
                ),
                onPressed: () =>
                    ScaffoldMessenger.of(context).hideCurrentSnackBar())
          ],
        ),
        backgroundColor: Colors.red,
        padding: const EdgeInsets.all(8),
        duration: const Duration(seconds: 4),
      ),
    );
  }

  static void fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
