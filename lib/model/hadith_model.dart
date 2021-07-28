// To parse this JSON data, do
//
//     final hadithModel = hadithModelFromJson(jsonString);

import 'dart:convert';

HadithModel hadithModelFromJson(String str) =>
    HadithModel.fromJson(json.decode(str));

String hadithModelToJson(HadithModel data) => json.encode(data.toJson());

class HadithModel {
  HadithModel({
    this.name,
    this.id,
    this.available,
  });

  final String? name;
  final String? id;
  final int? available;

  factory HadithModel.fromJson(Map<String, dynamic> json) => HadithModel(
        name: json["name"],
        id: json["id"],
        available: json["available"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
      };
}
