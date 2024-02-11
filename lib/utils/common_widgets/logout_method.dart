import 'package:flutter/material.dart';

import '../../ExportFile/export_file.dart';

class LogOutMethod {
  static logOut(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false,
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
