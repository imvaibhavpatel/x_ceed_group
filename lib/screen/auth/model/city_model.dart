// To parse this JSON data, do
//
//     final cityModel = cityModelFromJson(jsonString);

import 'dart:convert';

CityModel cityModelFromJson(String str) => CityModel.fromJson(json.decode(str));

String cityModelToJson(CityModel data) => json.encode(data.toJson());

class CityModel {
  bool status;
  List<City> cities;
  int totalPages;
  int citiesCount;

  CityModel({
    required this.status,
    required this.cities,
    required this.totalPages,
    required this.citiesCount,
  });

  factory CityModel.fromJson(Map<String, dynamic> json) => CityModel(
    status: json["status"],
    cities: List<City>.from(json["cities"].map((x) => City.fromJson(x))),
    totalPages: json["total_pages"],
    citiesCount: json["cities_count"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "cities": List<dynamic>.from(cities.map((x) => x.toJson())),
    "total_pages": totalPages,
    "cities_count": citiesCount,
  };
}

class City {
  int id;
  String name;

  City({
    required this.id,
    required this.name,
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
