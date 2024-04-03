
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_identity_proof_model.g.dart';


@HiveType(typeId: HiveTypeId.GetIdProofId)

class GetIdentityProofModel {
  @HiveField(0)
  String? s1;
  @HiveField(1)
  String? s2;
  @HiveField(2)
  String? s3;
  @HiveField(3)
  String? s4;
  @HiveField(4)
  String? s5;
  @HiveField(5)
  String? s6;
  @HiveField(6)
  String? s7;

  GetIdentityProofModel(
      {this.s1, this.s2, this.s3, this.s4, this.s5, this.s6, this.s7});

  GetIdentityProofModel.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    s2 = json['2'];
    s3 = json['3'];
    s4 = json['4'];
    s5 = json['5'];
    s6 = json['6'];
    s7 = json['7'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    data['4'] = this.s4;
    data['5'] = this.s5;
    data['6'] = this.s6;
    data['7'] = this.s7;
    return data;
  }
}
