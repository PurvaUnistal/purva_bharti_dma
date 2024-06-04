import 'package:pbg_app/ExportFile/export_file.dart';
part 'get_property_category_model.g.dart';

List<GetPropertyCategoryModel> getPropertyCategoryModelFromJson(String str) =>
    List<GetPropertyCategoryModel>.from(
        json.decode(str).map((x) => GetPropertyCategoryModel.fromJson(x)));

String getPropertyCategoryModelToJson(List<GetPropertyCategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@HiveType(typeId: HiveTypeId.GetProCateId)

class GetPropertyCategoryModel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  final String? id;

  GetPropertyCategoryModel({
    this.name,
    this.id,
  });

  factory GetPropertyCategoryModel.fromJson(Map<String, dynamic> json) =>
      GetPropertyCategoryModel(
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
