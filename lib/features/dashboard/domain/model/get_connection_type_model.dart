import 'package:hive/hive.dart';
import 'package:pbg_app/Utils/common_widgets/HiveDatabase/hive_box_name.dart';
part 'get_connection_type_model.g.dart';


@HiveType(typeId: HiveTypeId.ConnectionTypeModel)
class ConnectionTypeModel extends HiveObject {
  @HiveField(0)
  final String? name;

  ConnectionTypeModel({
     this.name,
  });

  factory ConnectionTypeModel.fromJson(Map<String, dynamic> json) {
    return ConnectionTypeModel(
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
    'name': name,
  };
  @override
  String toString() {
    // TODO: implement toString
    return name.toString();
  }
}