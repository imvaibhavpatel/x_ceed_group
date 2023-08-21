// To parse this JSON data, do
//
//     final bannerDetailsModel = bannerDetailsModelFromJson(jsonString);

import 'dart:convert';

BannerDetailsModel bannerDetailsModelFromJson(String str) => BannerDetailsModel.fromJson(json.decode(str));

String bannerDetailsModelToJson(BannerDetailsModel data) => json.encode(data.toJson());

class BannerDetailsModel {
  bool status;
  BannerDetails bannerDetails;

  BannerDetailsModel({
    required this.status,
    required this.bannerDetails,
  });

  factory BannerDetailsModel.fromJson(Map<String, dynamic> json) => BannerDetailsModel(
    status: json["status"],
    bannerDetails: BannerDetails.fromJson(json["banner_details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "banner_details": bannerDetails.toJson(),
  };
}

class BannerDetails {
  String status;
  int compId;
  int bannerId;
  List<Banner2> banner150X150;
  List<Banner2> banner700X700;

  BannerDetails({
    required this.status,
    required this.compId,
    required this.bannerId,
    required this.banner150X150,
    required this.banner700X700,
  });

  factory BannerDetails.fromJson(Map<String, dynamic> json) => BannerDetails(
    status: json["status"],
    compId: json["comp_id"],
    bannerId: json["banner_id"],
    banner150X150: List<Banner2>.from(json["banner150x150"].map((x) => Banner2.fromJson(x))),
    banner700X700: List<Banner2>.from(json["banner700x700"].map((x) => Banner2.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "comp_id": compId,
    "banner_id": bannerId,
    "banner150x150": List<dynamic>.from(banner150X150.map((x) => x.toJson())),
    "banner700x700": List<dynamic>.from(banner700X700.map((x) => x.toJson())),
  };
}

class Banner2 {
  int id;
  String originalName;
  String uploadPath;
  String version;
  String token;
  String status;

  Banner2({
    required this.id,
    required this.originalName,
    required this.uploadPath,
    required this.version,
    required this.token,
    required this.status,
  });

  factory Banner2.fromJson(Map<String, dynamic> json) => Banner2(
    id: json["id"],
    originalName: json["original_name"],
    uploadPath: json["upload_path"],
    version: json["version"],
    token: json["token"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "original_name": originalName,
    "upload_path": uploadPath,
    "version": version,
    "token": token,
    "status": status,
  };
}
