import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_accept_conversion_policy_model.g.dart';

List<GetAcceptConversionPolicyModel> getAcceptConversionPolicyModelFromJson(String str) =>
    List<GetAcceptConversionPolicyModel>.from(
        json.decode(str).map((x) => GetAcceptConversionPolicyModel.fromJson(x)));

String getAcceptConversionPolicyModelToJson(List<GetAcceptConversionPolicyModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetAcceptConversionPolicyId)

class GetAcceptConversionPolicyModel {

  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;


  GetAcceptConversionPolicyModel({this.key, this.value});

  GetAcceptConversionPolicyModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<GetAcceptConversionPolicyModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetAcceptConversionPolicyModel(key: e.key, value: e.value)).toList();
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }

  @override
  String toString() {
    return this.value ?? "";
  }
}
