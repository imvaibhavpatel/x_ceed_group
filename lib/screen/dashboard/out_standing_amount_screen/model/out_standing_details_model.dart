// To parse this JSON data, do
//
//     final outstandingDetailsModel = outstandingDetailsModelFromJson(jsonString);

import 'dart:convert';

OutstandingDetailsModel outstandingDetailsModelFromJson(String str) => OutstandingDetailsModel.fromJson(json.decode(str));

String outstandingDetailsModelToJson(OutstandingDetailsModel data) => json.encode(data.toJson());

class OutstandingDetailsModel {
  bool status;
  String message;
  OutstandingStats outstandingStats;
  OutstandingsDetails outstandingsDetails;

  OutstandingDetailsModel({
    required this.status,
    required this.message,
    required this.outstandingStats,
    required this.outstandingsDetails,
  });

  factory OutstandingDetailsModel.fromJson(Map<String, dynamic> json) => OutstandingDetailsModel(
    status: json["status"],
    message: json["message"],
    outstandingStats: OutstandingStats.fromJson(json["outstanding_stats"]),
    outstandingsDetails: OutstandingsDetails.fromJson(json["outstandings_details"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "outstanding_stats": outstandingStats.toJson(),
    "outstandings_details": outstandingsDetails.toJson(),
  };
}

class OutstandingStats {
  String accountName;
  int totalOutstandingAmt;
  int totalInvoiceAmt;
  int totalDueAmount;
  int totalOverdueAmount;
  double totalDueOutstandingPercentage;
  double totalOverdueOutstandingPercentage;

  OutstandingStats({
    required this.accountName,
    required this.totalOutstandingAmt,
    required this.totalInvoiceAmt,
    required this.totalDueAmount,
    required this.totalOverdueAmount,
    required this.totalDueOutstandingPercentage,
    required this.totalOverdueOutstandingPercentage,
  });

  factory OutstandingStats.fromJson(Map<String, dynamic> json) => OutstandingStats(
    accountName: json["account_name"],
    totalOutstandingAmt: json["total_outstanding_amt"],
    totalInvoiceAmt: json["total_invoice_amt"],
    totalDueAmount: json["total_due_amount"],
    totalOverdueAmount: json["total_overdue_amount"],
    totalDueOutstandingPercentage: json["total_due_outstanding_percentage"]?.toDouble(),
    totalOverdueOutstandingPercentage: json["total_overdue_outstanding_percentage"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "account_name": accountName,
    "total_outstanding_amt": totalOutstandingAmt,
    "total_invoice_amt": totalInvoiceAmt,
    "total_due_amount": totalDueAmount,
    "total_overdue_amount": totalOverdueAmount,
    "total_due_outstanding_percentage": totalDueOutstandingPercentage,
    "total_overdue_outstanding_percentage": totalOverdueOutstandingPercentage,
  };
}

class OutstandingsDetails {
  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  String nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  OutstandingsDetails({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory OutstandingsDetails.fromJson(Map<String, dynamic> json) => OutstandingsDetails(
    currentPage: json["current_page"],
    data:  List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  int id;
  int accountId;
  String accountType;
  String entryType;
  int invoiceId;
  int invoiceAmt;
  int outstandingAmt;
  int compId;
  String extSourceId;
  String externalAccountName;
  DateTime paymentDueDate;
  DateTime invoiceDate;
  String outstandingStatus;
  DateTime createdAt;
  DateTime updatedAt;
  String accountName;

  Datum({
    required this.id,
    required this.accountId,
    required this.accountType,
    required this.entryType,
    required this.invoiceId,
    required this.invoiceAmt,
    required this.outstandingAmt,
    required this.compId,
    required this.extSourceId,
    required this.externalAccountName,
    required this.paymentDueDate,
    required this.invoiceDate,
    required this.outstandingStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.accountName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    accountId: json["account_id"],
    accountType: json["account_type"],
    entryType: json["entry_type"],
    invoiceId: json["invoice_id"],
    invoiceAmt: json["invoice_amt"],
    outstandingAmt: json["outstanding_amt"],
    compId: json["comp_id"],
    extSourceId: json["ext_source_id"],
    externalAccountName: json["external_account_name"] ?? "" ,
    paymentDueDate: DateTime.parse(json["payment_due_date"]),
    invoiceDate: DateTime.parse(json["invoice_date"]),
    outstandingStatus: json["outstanding_status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    accountName: json["account_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "account_id": accountId,
    "account_type": accountType,
    "entry_type": entryType,
    "invoice_id": invoiceId,
    "invoice_amt": invoiceAmt,
    "outstanding_amt": outstandingAmt,
    "comp_id": compId,
    "ext_source_id": extSourceId,
    "external_account_name": externalAccountName,
    "payment_due_date": paymentDueDate.toIso8601String(),
    "invoice_date": invoiceDate.toIso8601String(),
    "outstanding_status": outstandingStatus,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "account_name": accountName,
  };
}
