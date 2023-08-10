// To parse this JSON data, do
//
//     final stateModel = stateModelFromJson(jsonString);

import 'dart:convert';

StateModel stateModelFromJson(String str) => StateModel.fromJson(json.decode(str));

String stateModelToJson(StateModel data) => json.encode(data.toJson());

class StateModel {
  bool status;
  List<StateName> states;
  int totalPages;
  int statesCount;

  StateModel({
    required this.status,
    required this.states,
    required this.totalPages,
    required this.statesCount,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) => StateModel(
    status: json["status"],
    states: List<StateName>.from(json["states"].map((x) => StateName.fromJson(x))),
    totalPages: json["total_pages"],
    statesCount: json["states_count"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "states": List<dynamic>.from(states.map((x) => x.toJson())),
    "total_pages": totalPages,
    "states_count": statesCount,
  };
}

class StateName {
  int id;
  String name;

  StateName({
    required this.id,
    required this.name,
  });

  factory StateName.fromJson(Map<String, dynamic> json) => StateName(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
