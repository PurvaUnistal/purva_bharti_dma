import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_accept_extra_fitting_cost_model.g.dart';

@HiveType(typeId: HiveTypeId.GetAcceptExtraFittingCostId)

class GetAcceptExtraFittingCostModel {
  @HiveField(0)
  String? s1;
  @HiveField(1)
  String? s2;
  @HiveField(2)
  String? s3;

  GetAcceptExtraFittingCostModel({this.s1, this.s2, this.s3});

  GetAcceptExtraFittingCostModel.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    return data;
  }
  @override
  String toString() {
    // TODO: implement toString
    return '{ ${this.s1}, ${this.s2}${this.s3} }';
  }
}
