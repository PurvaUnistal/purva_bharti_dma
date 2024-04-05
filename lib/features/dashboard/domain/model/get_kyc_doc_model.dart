
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pbg_app/common/HiveDatabase/hive_box_name.dart';
part 'get_kyc_doc_model.g.dart';


@HiveType(typeId: HiveTypeId.GetKycDocId)
class GetKycDocModel {
  @HiveField(0)
  String? s1;
  @HiveField(1)
  String? s2;
  @HiveField(2)
  String? s3;

  GetKycDocModel({this.s1, this.s2,
    this.s3
  });

  GetKycDocModel.fromJson(Map<String, dynamic> json) {
    s1 = json['1'] == null ? "" : json['1'];
    s2 = json['2'] == null ? "" : json['2'];
    s3 = json['3']== null ? "" : json['3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.s1;
    data['2'] = this.s2;
    data['3'] = this.s3;
    return data;
  }
}
