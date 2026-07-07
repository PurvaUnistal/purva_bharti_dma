import 'package:hive/hive.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/hive_box_name.dart';

part 'get_property_type_model.g.dart';

@HiveType(typeId: HiveTypeId.PropertyTypeModel)
class PropertyTypeModel extends HiveObject {
  @HiveField(0)
  final String? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? propertyCategoryId;

  @HiveField(3)
  final String? status;

  @HiveField(4)
  final String? createdBy;

  @HiveField(5)
  final String? updatedBy;

  @HiveField(6)
  final String? createdAt;

  @HiveField(7)
  final String? updatedAt;

  @HiveField(8)
  final String? code;

  PropertyTypeModel({
     this.id,
     this.name,
     this.propertyCategoryId,
     this.status,
     this.createdBy,
    this.updatedBy,
     this.createdAt,
     this.updatedAt,
    this.code,
  });

  factory PropertyTypeModel.fromJson(Map<String, dynamic> json) {
    return PropertyTypeModel(
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      propertyCategoryId:
      json['property_category_id']?.toString() ?? '',
      status: json['status']?.toString() ?? '',
      createdBy: json['created_by']?.toString() ?? '',
      updatedBy: json['updated_by']?.toString(),
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      code: json['code']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'property_category_id': propertyCategoryId,
      'status': status,
      'created_by': createdBy,
      'updated_by': updatedBy,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'code': code,
    };
  }


  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}