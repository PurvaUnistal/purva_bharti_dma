import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class SessionDialogUtils {
  static final SessionDialogUtils _instance = SessionDialogUtils.internal();

  SessionDialogUtils.internal();

  factory SessionDialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required Function okBtnFunction}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            title: const Text('Timeout'),
            content: const SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Session was expire you need to login again?'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: okBtnFunction(),
                child: const Text('Login'),
              ),
            ],
          );
        });
  }

  static logOut({required BuildContext context}) async {
    try {
      SharedPref.clearAll();
       Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginView()),
            (Route<dynamic> route) => false,
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
