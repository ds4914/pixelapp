// To parse this JSON data, do
//
//     final postalCodeDetailsResponseModel = postalCodeDetailsResponseModelFromJson(jsonString);

import 'dart:convert';

PostalCodeDetailsResponseModel postalCodeDetailsResponseModelFromJson(String str) => PostalCodeDetailsResponseModel.fromJson(json.decode(str));

String postalCodeDetailsResponseModelToJson(PostalCodeDetailsResponseModel data) => json.encode(data.toJson());

class PostalCodeDetailsResponseModel {
  final String? status;
  final int? statusCode;
  final int? postcode;
  final List<City>? city;
  final List<City>? state;

  PostalCodeDetailsResponseModel({
    this.status,
    this.statusCode,
    this.postcode,
    this.city,
    this.state,
  });

  factory PostalCodeDetailsResponseModel.fromJson(Map<String, dynamic> json) => PostalCodeDetailsResponseModel(
    status: json["status"],
    statusCode: json["statusCode"],
    postcode: json["postcode"],
    city: json["city"] == null ? [] : List<City>.from(json["city"]!.map((x) => City.fromJson(x))),
    state: json["state"] == null ? [] : List<City>.from(json["state"]!.map((x) => City.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "statusCode": statusCode,
    "postcode": postcode,
    "city": city == null ? [] : List<dynamic>.from(city!.map((x) => x.toJson())),
    "state": state == null ? [] : List<dynamic>.from(state!.map((x) => x.toJson())),
  };
}

class City {
  final int? id;
  final String? name;

  City({
    this.id,
    this.name,
  });

  factory City.fromJson(Map<String, dynamic> json) => City(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
