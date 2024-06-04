import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_not_interested_model.g.dart';

@HiveType(typeId: HiveTypeId.GetNotInterestedId)

class GetNotInterestedModel {
  @HiveField(0)
   String? key;
  @HiveField(1)
   String? value;

  GetNotInterestedModel({
    this.key,
    this.value,
  });

  GetNotInterestedModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<GetNotInterestedModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) =>
        GetNotInterestedModel(key: e.key, value: e.value)).toList();
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

