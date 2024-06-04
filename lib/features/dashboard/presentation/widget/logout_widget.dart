import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class LogoutWidget extends StatelessWidget {
  const LogoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height/4.9,
      margin: EdgeInsets.all(MediaQuery.of(context).size.height * 0.04),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(AppString.logout+"?", style: Styles.title,),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(AppString.logoutMsg, style: Styles.title,),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: ButtonWidget(text: AppString.logout,
                      onPressed: () async {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => const LoginView()),
                                (route) => false
                        );
                        await SharedPref.clearAll();
                      }
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.03,
                ),

                Flexible(
                  flex: 2,
                  child: ButtonWidget(
                      text: AppString.no,
                      onPressed: () {
                        Navigator.of(context).pop();
                      }
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
