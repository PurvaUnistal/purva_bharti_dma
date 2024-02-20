// To parse this JSON data, do
//
//     final bankNameListModel = bankNameListModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<String> bankNameListModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String bankNameListModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));
