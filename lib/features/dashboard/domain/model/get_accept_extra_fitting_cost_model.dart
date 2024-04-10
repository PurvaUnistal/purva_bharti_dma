import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_accept_extra_fitting_cost_model.g.dart';

@HiveType(typeId: HiveTypeId.GetAcceptExtraFittingCostId)

class GetAcceptExtraFittingCostModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;
  @HiveField(2)
  String? s3;

  GetAcceptExtraFittingCostModel({this.key, this.value});

  GetAcceptExtraFittingCostModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<GetAcceptExtraFittingCostModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetAcceptExtraFittingCostModel(key: e.key, value: e.value)).toList();
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
