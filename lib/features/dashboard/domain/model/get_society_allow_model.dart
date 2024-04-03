
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_society_allow_model.g.dart';


@HiveType(typeId: HiveTypeId.GetSocietyAllowId)

class GetSocietyAllowModel {
  @HiveField(0)
  String? s0;
  @HiveField(1)
  String? s1;

  GetSocietyAllowModel({this.s0, this.s1});

  GetSocietyAllowModel.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    return data;
  }
}
