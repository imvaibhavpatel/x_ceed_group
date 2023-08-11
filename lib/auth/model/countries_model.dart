// To parse this JSON data, do
//
//     final countriesModel = countriesModelFromJson(jsonString);

import 'dart:convert';

CountriesModel countriesModelFromJson(String str) => CountriesModel.fromJson(json.decode(str));

String countriesModelToJson(CountriesModel data) => json.encode(data.toJson());

class CountriesModel {
  bool status;
  List<Country> countries;
  int totalPages;
  int countriesCount;

  CountriesModel({
    required this.status,
    required this.countries,
    required this.totalPages,
    required this.countriesCount,
  });

  factory CountriesModel.fromJson(Map<String, dynamic> json) => CountriesModel(
    status: json["status"],
    countries: List<Country>.from(json["countries"].map((x) => Country.fromJson(x))),
    totalPages: json["total_pages"],
    countriesCount: json["countries_count"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
    "total_pages": totalPages,
    "countries_count": countriesCount,
  };
}

class Country {
  int id;
  String name;

  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
