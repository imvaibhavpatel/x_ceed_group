// To parse this JSON data, do
//
//     final invoiceListModel = invoiceListModelFromJson(jsonString);

import 'dart:convert';

InvoiceListModel invoiceListModelFromJson(String str) =>
    InvoiceListModel.fromJson(json.decode(str));

String invoiceListModelToJson(InvoiceListModel data) =>
    json.encode(data.toJson());

class InvoiceListModel {
  bool status;
  String message;
  Result result;

  InvoiceListModel({
    required this.status,
    required this.message,
    required this.result,
  });

  factory InvoiceListModel.fromJson(Map<String, dynamic> json) =>
      InvoiceListModel(
        status: json["status"],
        message: json["message"],
        result: Result.fromJson(json["result"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "result": result.toJson(),
      };
}

class Result {
  int currentPage;
  List<InvoiceList> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  dynamic nextPageUrl;
  String path;
  String perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  Result({
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

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        currentPage: json["current_page"],
        data: List<InvoiceList>.from(
            json["data"].map((x) => InvoiceList.fromJson(x))),
        firstPageUrl: json["first_page_url"],
        from: json["from"] ?? 0,
        lastPage: json["last_page"],
        lastPageUrl: json["last_page_url"],
        nextPageUrl: json["next_page_url"],
        path: json["path"],
        perPage: json["per_page"],
        prevPageUrl: json["prev_page_url"],
        to: json["to"] ?? "",
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

class InvoiceList {
  int invoiceId;
  int compInvoiceId;
  double totalAmount;
  double pendingAmount;
  int paidAmount;
  DateTime invoiceDate;
  String status;
  String invoiceSourceId;
  String accountName;
  String sellerAccountName;
  String orderedProductTotalQty;
  int orderedProductCount;

  InvoiceList({
    required this.invoiceId,
    required this.compInvoiceId,
    required this.totalAmount,
    required this.pendingAmount,
    required this.paidAmount,
    required this.invoiceDate,
    required this.status,
    required this.invoiceSourceId,
    required this.accountName,
    required this.sellerAccountName,
    required this.orderedProductTotalQty,
    required this.orderedProductCount,
  });

  factory InvoiceList.fromJson(Map<String, dynamic> json) => InvoiceList(
        invoiceId: json["invoice_id"],
        compInvoiceId: json["comp_invoice_id"],
        totalAmount: json["total_amount"].toDouble(),
        pendingAmount: json["pending_amount"].toDouble(),
        paidAmount: json["paid_amount"],
        invoiceDate: DateTime.parse(json["invoice_date"]),
        status: json["status"],
        invoiceSourceId: json["invoice_source_id"],
        accountName: json["account_name"],
        sellerAccountName: json["seller_account_name"],
        orderedProductTotalQty: json["ordered_product_total_qty"],
        orderedProductCount: json["ordered_product_count"],
      );

  Map<String, dynamic> toJson() => {
        "invoice_id": invoiceId,
        "comp_invoice_id": compInvoiceId,
        "total_amount": totalAmount,
        "pending_amount": pendingAmount,
        "paid_amount": paidAmount,
        "invoice_date":
            "${invoiceDate.year.toString().padLeft(4, '0')}-${invoiceDate.month.toString().padLeft(2, '0')}-${invoiceDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "invoice_source_id": invoiceSourceId,
        "account_name": accountName,
        "seller_account_name": sellerAccountName,
        "ordered_product_total_qty": orderedProductTotalQty,
        "ordered_product_count": orderedProductCount,
      };
}
