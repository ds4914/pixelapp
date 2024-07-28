// To parse this JSON data, do
//
//     final panCardDetailsRequestModel = panCardDetailsRequestModelFromJson(jsonString);

import 'dart:convert';

PanCardDetailsRequestModel panCardDetailsRequestModelFromJson(String str) => PanCardDetailsRequestModel.fromJson(json.decode(str));

String panCardDetailsRequestModelToJson(PanCardDetailsRequestModel data) => json.encode(data.toJson());

class PanCardDetailsRequestModel {
  final String? panNumber;

  PanCardDetailsRequestModel({
    this.panNumber,
  });

  factory PanCardDetailsRequestModel.fromJson(Map<String, dynamic> json) => PanCardDetailsRequestModel(
    panNumber: json["panNumber"],
  );

  Map<String, dynamic> toJson() => {
    "panNumber": panNumber,
  };
}
