import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_kyc_doc_model.g.dart';


@HiveType(typeId: HiveTypeId.GetKycDocId)
class GetKycDocModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetKycDocModel({this.key, this.value,
  });

  GetKycDocModel.fromJson(Map<String, dynamic> json) {
    key = json['key'] == null ? "" : json['key'];
    value = json['value'] == null ? "" : json['value'];
  }

  static List<GetKycDocModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetKycDocModel(key: e.key, value: e.value)).toList();
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
