import 'package:flutter/material.dart';
import 'package:pbg_app/utils/common_widgets/app_color.dart';

class CommonStyle {

  static OutlineInputBorder border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
        color: AppColor.green, style: BorderStyle.solid, width: 0.80),
  );

  static OutlineInputBorder borderGrey = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
        color: AppColor.grey, style: BorderStyle.solid, width: 0.80),
  );

  static OutlineInputBorder borderRed = OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: BorderSide(
        color: AppColor.red, style: BorderStyle.solid, width: 0.80),
  );

  static Widget vertical({ BuildContext context}) {
    return SizedBox(
      height: MediaQuery
          .of(context)
          .size
          .height * 0.016,
    );
  }

  static Widget widthSpace({ BuildContext context}) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.016,
    );
  }

  static Widget col({ Widget child, BuildContext context}) {
    return Column(
      children: [
        CommonStyle.vertical(context: context),
        child,
      ],
    );
  }
  static TextStyle stars = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red);
  static TextStyle labels = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 12, color: Colors.green.shade800);

}
