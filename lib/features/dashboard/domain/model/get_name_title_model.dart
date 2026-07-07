import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_name_title_model.g.dart';


List<GetNameTitleModel> getNameTitleModelFromJson(String str) =>
    List<GetNameTitleModel>.from(
        json.decode(str).map((x) => GetNameTitleModel.fromJson(x)));

String getNameTitleModelToJson(List<GetNameTitleModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetNameTitle)

class GetNameTitleModel {
  @HiveField(0)
   String? name;
  @HiveField(1)
   String? id;

  GetNameTitleModel({
    this.name,
    this.id,
  });

  factory GetNameTitleModel.fromJson(Map<String, dynamic> json) =>
      GetNameTitleModel(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
  @override
  String toString() {
    // TODO: implement toString
    return name!;
  }
}
