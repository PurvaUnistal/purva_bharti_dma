
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_initial_deposit_status_model.g.dart';


@HiveType(typeId: HiveTypeId.GetInitDepositStatusId)
class GetInitialDepositStatusModel {
  @HiveField(0)
  String? s0;
  @HiveField(1)
  String? s1;
  @HiveField(2)
  String? s2;

  GetInitialDepositStatusModel({this.s0, this.s1, this.s2});

  GetInitialDepositStatusModel.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    return data;
  }
}
