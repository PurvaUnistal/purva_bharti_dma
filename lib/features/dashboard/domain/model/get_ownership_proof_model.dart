
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_ownership_proof_model.g.dart';


@HiveType(typeId: HiveTypeId.GetOwnershipProofId)
class GetOwnershipProofModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetOwnershipProofModel(
      {this.key, this.value,});

  GetOwnershipProofModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<GetOwnershipProofModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetOwnershipProofModel(key: e.key, value: e.value)).toList();
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

