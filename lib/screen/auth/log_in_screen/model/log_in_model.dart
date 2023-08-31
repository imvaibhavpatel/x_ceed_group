// To parse this JSON data, do
//
//     final logInModel = logInModelFromJson(jsonString);

import 'dart:convert';

LogInModel logInModelFromJson(String str) => LogInModel.fromJson(json.decode(str));

String logInModelToJson(LogInModel data) => json.encode(data.toJson());

class LogInModel {
  bool success;
  Response response;
  String timezone;
  String timezoneString;
  String currency;
  int isSelfieCheckin;
  CustSupMappingSetting custSupMappingSetting;
  String expenseLabel;
  int mdfDtTime;

  LogInModel({
    required this.success,
    required this.response,
    required this.timezone,
    required this.timezoneString,
    required this.currency,
    required this.isSelfieCheckin,
    required this.custSupMappingSetting,
    required this.expenseLabel,
    required this.mdfDtTime,
  });

  factory LogInModel.fromJson(Map<String, dynamic> json) => LogInModel(
    success: json["success"],
    response: Response.fromJson(json["response"]),
    timezone: json["timezone"],
    timezoneString: json["timezone_string"],
    currency: json["currency"],
    isSelfieCheckin: json["is_selfie_checkin"],
    custSupMappingSetting: CustSupMappingSetting.fromJson(json["cust_sup_mapping_setting"]),
    expenseLabel: json["expense_label"],
    mdfDtTime: json["mdf_dt_time"],
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "response": response.toJson(),
    "timezone": timezone,
    "timezone_string": timezoneString,
    "currency": currency,
    "is_selfie_checkin": isSelfieCheckin,
    "cust_sup_mapping_setting": custSupMappingSetting.toJson(),
    "expense_label": expenseLabel,
    "mdf_dt_time": mdfDtTime,
  };
}

class CustSupMappingSetting {
  CustSupMappingSetting();

  factory CustSupMappingSetting.fromJson(Map<String, dynamic> json) => CustSupMappingSetting(
  );

  Map<String, dynamic> toJson() => {
  };
}

class Response {
  String message;
  Result result;

  Response({
    required this.message,
    required this.result,
  });

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    message: json["message"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result.toJson(),
  };
}

class Result {
  int? userId;
  String? userEmail;
  String? compId;
  int? userTypeId;
  String? userTypeName;
  String? userFname;
  String? userNumber;
  String? compName;
  String? userProfilePic;
  int? custId;
  int? supId;
  String? custName;
  String? supName;
  int? orgId;
  String? orgName;
  int? custTypeId;
  int? supTypeId;
  String? checkingStatus;
  int? checkInTime;
  int? checkOutTime;
  int? checkInLatitude;
  int? checkOutLatitude;
  int? checkInLongitude;
  int? checkOutLongitude;
  String? checkInAddress;
  String? checkOutAddress;
  int? selfiImageUrl;
  String? token;
  LabelLst? labelLst;
  String? companyLogo;
  String? onlinePayment;

  Result({
     this.userId,
     this.userEmail,
     this.compId,
     this.userTypeId,
     this.userTypeName,
     this.userFname,
     this.userNumber,
     this.compName,
     this.userProfilePic,
     this.custId,
     this.supId,
     this.custName,
     this.supName,
     this.orgId,
     this.orgName,
     this.custTypeId,
     this.supTypeId,
     this.checkingStatus,
     this.checkInTime,
     this.checkOutTime,
     this.checkInLatitude,
     this.checkOutLatitude,
     this.checkInLongitude,
     this.checkOutLongitude,
     this.checkInAddress,
     this.checkOutAddress,
     this.selfiImageUrl,
     this.token,
     this.labelLst,
     this.companyLogo,
     this.onlinePayment,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    userId: json["user_id"],
    userEmail: json["user_email"],
    compId: json["comp_id"],
    userTypeId: json["user_type_id"],
    userTypeName: json["user_type_name"],
    userFname: json["user_fname"],
    userNumber: json["user_number"],
    compName: json["comp_name"],
    userProfilePic: json["user_profile_pic"],
    custId: json["cust_id"],
    supId: json["sup_id"],
    custName: json["cust_name"],
    supName: json["sup_name"],
    orgId: json["org_id"],
    orgName: json["org_name"],
    custTypeId: json["cust_type_id"],
    supTypeId: json["sup_type_id"],
    checkingStatus: json["checking_status"],
    checkInTime: json["checkIn_time"],
    checkOutTime: json["checkOut_time"],
    checkInLatitude: json["checkIn_latitude"],
    checkOutLatitude: json["checkOut_latitude"],
    checkInLongitude: json["checkIn_longitude"],
    checkOutLongitude: json["checkOut_longitude"],
    checkInAddress: json["checkIn_address"],
    checkOutAddress: json["checkOut_address"],
    selfiImageUrl: json["selfi_image_url"],
    token: json["token"],
    labelLst: LabelLst.fromJson(json["labelLst"]),
    companyLogo: json["company_logo"],
    onlinePayment: json["online_payment"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "user_email": userEmail,
    "comp_id": compId,
    "user_type_id": userTypeId,
    "user_type_name": userTypeName,
    "user_fname": userFname,
    "user_number": userNumber,
    "comp_name": compName,
    "user_profile_pic": userProfilePic,
    "cust_id": custId,
    "sup_id": supId,
    "cust_name": custName,
    "sup_name": supName,
    "org_id": orgId,
    "org_name": orgName,
    "cust_type_id": custTypeId,
    "sup_type_id": supTypeId,
    "checking_status": checkingStatus,
    "checkIn_time": checkInTime,
    "checkOut_time": checkOutTime,
    "checkIn_latitude": checkInLatitude,
    "checkOut_latitude": checkOutLatitude,
    "checkIn_longitude": checkInLongitude,
    "checkOut_longitude": checkOutLongitude,
    "checkIn_address": checkInAddress,
    "checkOut_address": checkOutAddress,
    "selfi_image_url": selfiImageUrl,
    "token": token,
    "labelLst": labelLst?.toJson(),
    "company_logo": companyLogo,
    "online_payment": onlinePayment,
  };
}

class LabelLst {
  String customer;
  String supplier;
  String salesman;
  String route;
  String organisation;
  String overview;
  String lead;
  String mrp;
  String tax;

  LabelLst({
    required this.customer,
    required this.supplier,
    required this.salesman,
    required this.route,
    required this.organisation,
    required this.overview,
    required this.lead,
    required this.mrp,
    required this.tax,
  });

  factory LabelLst.fromJson(Map<String, dynamic> json) => LabelLst(
    customer: json["customer"],
    supplier: json["supplier"],
    salesman: json["salesman"],
    route: json["route"],
    organisation: json["organisation"],
    overview: json["overview"],
    lead: json["lead"],
    mrp: json["mrp"],
    tax: json["tax"],
  );

  Map<String, dynamic> toJson() => {
    "customer": customer,
    "supplier": supplier,
    "salesman": salesman,
    "route": route,
    "organisation": organisation,
    "overview": overview,
    "lead": lead,
    "mrp": mrp,
    "tax": tax,
  };
}
