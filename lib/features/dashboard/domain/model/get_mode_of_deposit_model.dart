
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_mode_of_deposit_model.g.dart';

@HiveType(typeId: HiveTypeId.GetModeOfDepositId)

class GetModeOfDepositModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetModeOfDepositModel({this.key, this.value});

  GetModeOfDepositModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }
  static List<GetModeOfDepositModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetModeOfDepositModel(key: e.key, value: e.value)).toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['value'] = this.value;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return value ?? "";
  }
}
