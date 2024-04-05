import 'package:flutter/material.dart';
import 'package:pbg_app/common/Utils/common_widget/app_color.dart';

class Styles {
  static TextStyle rel = TextStyle(color: Colors.white, fontWeight: FontWeight.w800,fontSize: 8);

  static TextStyle login = TextStyle(color: Colors.white, fontWeight: FontWeight.bold,);

  static TextStyle title = TextStyle(fontSize: 12, color: AppColor.prime, fontWeight: FontWeight.bold);

  static TextStyle subTitle = const TextStyle(fontSize: 8, fontWeight: FontWeight.w800);

  static TextStyle stars = const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red);

  static TextStyle labels =  TextStyle(fontWeight: FontWeight.w400, fontSize: 12, color: AppColor.prime);

  static TextStyle texts = const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black);

  static TextStyle textW = const TextStyle(fontWeight: FontWeight.normal, fontSize: 12, color: Colors.white);
}
