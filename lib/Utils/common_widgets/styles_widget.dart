import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';
import 'package:pbg_app/Utils/common_widgets/app_color.dart';

class Styles {
  static TextStyle rel = TextStyle(
      color: AppColor.prime,
      fontWeight: FontWeight.w800, fontSize: 8
  );

  static TextStyle relB = TextStyle(
      color: AppColor.black,
      fontWeight: FontWeight.w800, fontSize: 9
  );

  static TextStyle login = TextStyle(
    color:AppColor.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title = TextStyle(
      fontSize: 12,
      color: AppColor.prime,
      fontWeight: FontWeight.bold
  );

  static TextStyle title1 = TextStyle(
      fontSize: 10,
      color: Colors.black,
      fontWeight: FontWeight.bold
  );

  static TextStyle subTitle = TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w800
  );

  static TextStyle subStar = TextStyle(
      fontSize: 8,
      fontWeight: FontWeight.w800,
      color: Colors.red
  );

  static TextStyle stars = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15, color: Colors.red
  );

  static TextStyle table = TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 15,
      color:AppColor.red
  );

  static TextStyle labels = TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      color:AppColor.prime
  );

  static TextStyle texts = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 12,
      color: Colors.black
  );

}
