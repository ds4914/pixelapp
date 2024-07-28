// To parse this JSON data, do
//
//     final postalCodeDetailsRequestModel = postalCodeDetailsRequestModelFromJson(jsonString);

import 'dart:convert';

PostalCodeDetailsRequestModel postalCodeDetailsRequestModelFromJson(String str) => PostalCodeDetailsRequestModel.fromJson(json.decode(str));

String postalCodeDetailsRequestModelToJson(PostalCodeDetailsRequestModel data) => json.encode(data.toJson());

class PostalCodeDetailsRequestModel {
  final int? postcode;

  PostalCodeDetailsRequestModel({
    this.postcode,
  });

  factory PostalCodeDetailsRequestModel.fromJson(Map<String, dynamic> json) => PostalCodeDetailsRequestModel(
    postcode: json["postcode"],
  );

  Map<String, dynamic> toJson() => {
    "postcode": postcode,
  };
}
