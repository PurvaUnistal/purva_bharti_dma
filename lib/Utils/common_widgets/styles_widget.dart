import 'package:flutter/material.dart';
import 'package:pbg_app/ExportFile/export_file.dart';

class Styles {
  static TextStyle rel = TextStyle(
      color: AppColor.prime, fontWeight: FontWeight.w800, fontSize: 8);
  static TextStyle login = const TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );

  static TextStyle title = TextStyle(
      fontSize: 12, color: Colors.green.shade800, fontWeight: FontWeight.bold);
  static TextStyle title1 =
      const TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold);

  static TextStyle subTitle =
      const TextStyle(fontSize: 8, fontWeight: FontWeight.w800);
  static TextStyle subStar = const TextStyle(
      fontSize: 8, fontWeight: FontWeight.w800, color: Colors.red);

  static TextStyle stars = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.red);
  static TextStyle table = const TextStyle(
      fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white);

  static TextStyle labels = TextStyle(
      fontWeight: FontWeight.w400, fontSize: 12, color: Colors.green.shade800);

  static TextStyle texts = const TextStyle(
      fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black);
}
