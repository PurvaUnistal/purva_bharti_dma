import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';


class DialogBoxWidget extends StatelessWidget {
  const DialogBoxWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        AppString.logout,
      ),
      content: Text(
        AppString.logoutMsg,
      ),
      actions: [
        ButtonWidget(
          text: AppString.no,
          onPressed: () => Navigator.pop(context),
        ),
        ButtonWidget(
            text: AppString.yes,
            onPressed: () async {
              await PreferenceUtil.clearAll();
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RoutesName.splashView, (Route<dynamic> route) => false);
              // Navigator.pushReplacementNamed(context, RoutesName.loginView);
            })
      ],
    );
  }
}
