import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_premise_type_model.g.dart';


@HiveType(typeId: HiveTypeId.GetPremiseTypeModel)
class GetPremiseTypeModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetPremiseTypeModel(
      {this.key, this.value,});

  GetPremiseTypeModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<GetPremiseTypeModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetPremiseTypeModel(key: e.key, value: e.value)).toList();
  }

  Map<String, dynamic> toJson() {
     Map<String, dynamic> data = new Map<String, dynamic>();
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

