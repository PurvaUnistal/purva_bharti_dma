/*// class GetNotInterestedModel {
//   GetNotInterestedModel({
//     this.id,
//     this.name,
//   });
//
//   String? id;
//   String? name;
//
//   factory GetNotInterestedModel.fromJson(Map<String, dynamic> json) =>
//       GetNotInterestedModel(
//         id: json["0"] == null ? null : json["0"],
//         name: json["1"] == null ? null : json["1"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "0": id == null ? null : id,
//         "1": name == null ? null : name,
//       };
//   @override
//   String toString() {
//     // TODO: implement toString
//     return name!;
//   }
// }

// To parse this JSON data, do
//
//     final getNotInterestedModel = getNotInterestedModelFromJson(jsonString);

import 'dart:convert';

Map<String, String> getNotInterestedModelFromJson(String str) =>
    Map.from(json.decode(str)).map((k, v) => MapEntry<String, String>(k, v));

String getNotInterestedModelToJson(Map<String, String> data) =>
    json.encode(Map.from(data).map((k, v) => MapEntry<String, dynamic>(k, v)));

class GetNotInterestedModel {
  GetNotInterestedModel({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory GetNotInterestedModel.fromJson(Map<String, dynamic> json) =>
      GetNotInterestedModel(
        id: json["0"] == null ? null : json["0"],
        name: json["1"] == null ? null : json["1"],
      );

  Map<String, dynamic> toJson() => {
        "0": id == null ? null : id,
        "1": name == null ? null : name,
      };
  @override
  String toString() {
    // TODO: implement toString
    return name!;
  }
}*/

import 'dart:convert';

class GetNotInterestedModel {
  final String? no;
  final String? yes;

  GetNotInterestedModel({
    this.no,
    this.yes,
  });

  factory GetNotInterestedModel.fromRawJson(String str) =>
      GetNotInterestedModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetNotInterestedModel.fromJson(Map<String, dynamic> json) =>
      GetNotInterestedModel(
        no: json["0"],
        yes: json["1"],
      );

  Map<String, dynamic> toJson() => {
        "0": no,
        "1": yes,
      };
}
