import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_initial_deposit_status_model.g.dart';


@HiveType(typeId: HiveTypeId.GetInitDepositStatusId)
class GetInitialDepositStatusModel {
  @HiveField(0)
  String? key;
  @HiveField(1)
  String? value;

  GetInitialDepositStatusModel({this.key, this.value,});

  GetInitialDepositStatusModel.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    value = json['value'];
  }

  static List<GetInitialDepositStatusModel> mapToList(Map<String, dynamic> mapData) {
    return mapData.entries.map((e) => GetInitialDepositStatusModel(key: e.key, value: e.value)).toList();
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
