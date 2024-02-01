import 'package:flutter/material.dart';
import '../../ExportFile/export_file.dart';

class LogOutMethod {
  static logOut(BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool(GlobalConstants.isUserLogIn, false);
      prefs.setString(GlobalConstants.username, '');
      prefs.setString(GlobalConstants.password, '');
      prefs.setString(GlobalConstants.id, '');
      prefs.setString(GlobalConstants.token, '');
      prefs.setString(GlobalConstants.schema, '');
      prefs.setString(GlobalConstants.name, '');
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
