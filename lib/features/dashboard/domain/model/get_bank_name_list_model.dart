import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_bank_name_list_model.g.dart';

List<String> bankNameListModelFromJson(String str) => List<String>.from(json.decode(str).map((x) => x));

String bankNameListModelToJson(List<String> data) => json.encode(List<dynamic>.from(data.map((x) => x)));


@HiveType(typeId: HiveTypeId.BankNameListModel)

class BankNameListModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  BankNameListModel({this.key, this.value, });

  BankNameListModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<BankNameListModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => BankNameListModel(key: e.key, value: e.value)).toList();
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