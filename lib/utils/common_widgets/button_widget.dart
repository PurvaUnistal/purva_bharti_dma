import 'package:flutter/material.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';
import 'package:pbg_app/utils/common_widgets/app_style.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final Function onPressed;
  const ButtonWidget({Key key, this.onPressed, this.textButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        child: Container(
          width: double.infinity,
          child: Text(
              textButton,
              textAlign: TextAlign.center,
              style: AppStyle.btn()
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: <Color>[
                    AppColor.appColor1,
                    AppColor.appColor2,
                  ]),
              borderRadius: BorderRadius.all(Radius.circular(80.0))),
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        ));
  }
}
