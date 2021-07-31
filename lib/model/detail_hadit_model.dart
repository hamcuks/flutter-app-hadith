// To parse this JSON data, do
//
//     final detailHadithModel = detailHadithModelFromJson(jsonString);

import 'dart:convert';

DetailHadithModel detailHadithModelFromJson(String str) =>
    DetailHadithModel.fromJson(json.decode(str));

String detailHadithModelToJson(DetailHadithModel data) =>
    json.encode(data.toJson());

class DetailHadithModel {
  DetailHadithModel({
    this.name,
    this.id,
    this.available,
    this.contents,
  });

  final String? name;
  final String? id;
  final int? available;
  final Contents? contents;

  factory DetailHadithModel.fromJson(Map<String, dynamic> json) =>
      DetailHadithModel(
        name: json["name"],
        id: json["id"],
        available: json["available"],
        contents: Contents.fromJson(json["contents"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "available": available,
        "contents": contents?.toJson(),
      };
}

class Contents {
  Contents({
    this.number,
    this.arab,
    this.id,
  });

  final int? number;
  final String? arab;
  final String? id;

  factory Contents.fromJson(Map<String, dynamic> json) => Contents(
        number: json["number"],
        arab: json["arab"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "arab": arab,
        "id": id,
      };
}
