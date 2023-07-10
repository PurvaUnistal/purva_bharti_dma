
import 'package:flutter/material.dart';
import 'dart:convert';

List<StatusResponse> countryFromJson(String str) =>
    List<StatusResponse>.from(json.decode(str).map((x) => StatusResponse.fromJson(x)));

String countryToJson(List<StatusResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
class StatusResponse {
  String s0;
  String s1;
  String s2;

  StatusResponse({this.s0, this.s1, this.s2});

  StatusResponse.fromJson(Map<String, dynamic> json) {
    s0 = json['0'];
    s1 = json['1'];
    s2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['0'] = this.s0;
    data['1'] = this.s1;
    data['2'] = this.s2;
    return data;
  }
}