// To parse this JSON data, do
//
//     final panCardDetailsResponseModel = panCardDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

PanCardDetailsResponseModel panCardDetailsResponseModelFromJson(String str) => PanCardDetailsResponseModel.fromJson(json.decode(str));

String panCardDetailsResponseModelToJson(PanCardDetailsResponseModel data) => json.encode(data.toJson());

class PanCardDetailsResponseModel {
  final String? status;
  final int? statusCode;
  final bool? isValid;
  final String? fullName;

  PanCardDetailsResponseModel({
    this.status,
    this.statusCode,
    this.isValid,
    this.fullName,
  });

  factory PanCardDetailsResponseModel.fromJson(Map<String, dynamic> json) => PanCardDetailsResponseModel(
    status: json["status"],
    statusCode: json["statusCode"],
    isValid: json["isValid"],
    fullName: json["fullName"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "isValid": isValid,
    "fullName": fullName,
  };
}
