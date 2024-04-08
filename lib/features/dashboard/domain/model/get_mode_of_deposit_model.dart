
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_mode_of_deposit_model.g.dart';

@HiveType(typeId: HiveTypeId.GetModeOfDepositId)

class GetModeOfDepositModel {
  @HiveField(0)
  String? s1;
  @HiveField(1)
  String? s2;

  GetModeOfDepositModel({this.s1, this.s2});

  GetModeOfDepositModel.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return '{ ${this.s1}, ${this.s2} }';
  }
}
