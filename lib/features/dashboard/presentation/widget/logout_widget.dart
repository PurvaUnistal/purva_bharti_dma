import 'package:flutter/material.dart';
import 'package:pbg_app/common/Utils/SharedPrefs/SharedPreference.dart';
import 'package:pbg_app/common/Utils/common_widget/app_string.dart';
import 'package:pbg_app/common/Utils/common_widget/button_widget.dart';
import 'package:pbg_app/common/Utils/common_widget/styles_widget.dart';
import 'package:pbg_app/features/login/presentation/login_page.dart';

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
                        await PreferenceUtils.clearAll();
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
