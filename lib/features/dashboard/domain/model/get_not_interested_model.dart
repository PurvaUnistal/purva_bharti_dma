import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_not_interested_model.g.dart';

@HiveType(typeId: HiveTypeId.GetNotInterestedId)

class GetNotInterestedModel {
  @HiveField(0)
  final String? no;
  @HiveField(1)
  final String? yes;

  GetNotInterestedModel({
    this.no,
    this.yes,
  });

  factory GetNotInterestedModel.fromRawJson(String str) =>
      GetNotInterestedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetNotInterestedModel.fromJson(Map<String, dynamic> json) =>
      GetNotInterestedModel(
        no: json["0"],
        yes: json["1"],
      );

  Map<String, dynamic> toJson() => {
        "0": no,
        "1": yes,
      };
}
