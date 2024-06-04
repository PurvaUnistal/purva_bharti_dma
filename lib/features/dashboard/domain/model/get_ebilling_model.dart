import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_ebilling_model.g.dart';


@HiveType(typeId: HiveTypeId.GetEBillingId)

class GetEBillingModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetEBillingModel({this.key, this.value});

  GetEBillingModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }
  static List<GetEBillingModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetEBillingModel(key: e.key, value: e.value)).toList();
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
