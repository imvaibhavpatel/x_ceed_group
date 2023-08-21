// To parse this JSON data, do
//
//     final homeDetailsModel = homeDetailsModelFromJson(jsonString);

import 'dart:convert';

HomeDetailsModel homeDetailsModelFromJson(String str) =>
    HomeDetailsModel.fromJson(json.decode(str));

String homeDetailsModelToJson(HomeDetailsModel data) =>
    json.encode(data.toJson());

class HomeDetailsModel {
  bool status;
  String message;
  Analytics analytics;
  BriefAnalytics briefAnalytics;

  HomeDetailsModel({
    required this.status,
    required this.message,
    required this.analytics,
    required this.briefAnalytics,
  });

  factory HomeDetailsModel.fromJson(Map<String, dynamic> json) =>
      HomeDetailsModel(
        status: json["status"],
        message: json["message"],
        analytics: Analytics.fromJson(json["analytics"]),
        briefAnalytics: BriefAnalytics.fromJson(json["brief_analytics"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "analytics": analytics.toJson(),
        "brief_analytics": briefAnalytics.toJson(),
      };
}

class Analytics {
  int bookingAmount;
  int invoiceAmount;
  int pendingAmount;
  int totalOutstandingAmount;
  int creditLimitAmount;
  int paymentDoneAmount;

  Analytics({
    required this.bookingAmount,
    required this.invoiceAmount,
    required this.pendingAmount,
    required this.totalOutstandingAmount,
    required this.creditLimitAmount,
    required this.paymentDoneAmount,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) => Analytics(
        bookingAmount: json["booking_amount"],
        invoiceAmount: json["invoice_amount"],
        pendingAmount: json["pending_amount"],
        totalOutstandingAmount: json["total_outstanding_amount"],
        creditLimitAmount: json["credit_limit_amount"],
        paymentDoneAmount: json["payment_done_amount"],
      );

  Map<String, dynamic> toJson() => {
        "booking_amount": bookingAmount,
        "invoice_amount": invoiceAmount,
        "pending_amount": pendingAmount,
        "total_outstanding_amount": totalOutstandingAmount,
        "credit_limit_amount": creditLimitAmount,
        "payment_done_amount": paymentDoneAmount,
      };
}

class BriefAnalytics {
  OutstandingAnalytics outstandingAnalytics;
  InvoiceAnalytics invoiceAnalytics;
  OrderAnalytics orderAnalytics;
  List<dynamic> paymentsCollectionStats;

  BriefAnalytics({
    required this.outstandingAnalytics,
    required this.invoiceAnalytics,
    required this.orderAnalytics,
    required this.paymentsCollectionStats,
  });

  factory BriefAnalytics.fromJson(Map<String, dynamic> json) => BriefAnalytics(
        outstandingAnalytics: json["outstanding_analytics"] != null
            ? OutstandingAnalytics.fromJson(json["outstanding_analytics"])
            : OutstandingAnalytics(
                accountName: '',
                totalDueAmount: 0,
                totalInvoiceAmt: 0,
                totalOutstandingAmt: 0,
                totalOverdueAmount: 0),
        invoiceAnalytics: json["invoice_analytics"] != null
            ? InvoiceAnalytics.fromJson(json["invoice_analytics"])
            : InvoiceAnalytics(
                customerInvoiceAmount: 0,
                invoiceCount: 0,
                supplierInvoiceAmount: 0,
                totalAmount: 0,
              ),
        orderAnalytics: json["order_analytics"] != null
            ? OrderAnalytics.fromJson(json["order_analytics"])
            : OrderAnalytics(
                customerOrderAmount: 0,
                orderAmount: 0,
                orderCount: 0,
                supplierOrderAmount: 0,
              ),
        paymentsCollectionStats:  List<dynamic>.from(
                json["payments_collection_stats"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "outstanding_analytics": outstandingAnalytics.toJson(),
        "invoice_analytics": invoiceAnalytics.toJson(),
        "order_analytics": orderAnalytics.toJson(),
        "payments_collection_stats":
            List<dynamic>.from(paymentsCollectionStats.map((x) => x)),
      };
}

class InvoiceAnalytics {
  int customerInvoiceAmount;
  int supplierInvoiceAmount;
  int totalAmount;
  int invoiceCount;

  InvoiceAnalytics({
    required this.customerInvoiceAmount,
    required this.supplierInvoiceAmount,
    required this.totalAmount,
    required this.invoiceCount,
  });

  factory InvoiceAnalytics.fromJson(Map<String, dynamic> json) =>
      InvoiceAnalytics(
        customerInvoiceAmount: json["customer_invoice_amount"],
        supplierInvoiceAmount: json["supplier_invoice_amount"],
        totalAmount: json["total_amount"],
        invoiceCount: json["invoice_count"],
      );

  Map<String, dynamic> toJson() => {
        "customer_invoice_amount": customerInvoiceAmount,
        "supplier_invoice_amount": supplierInvoiceAmount,
        "total_amount": totalAmount,
        "invoice_count": invoiceCount,
      };
}

class OrderAnalytics {
  int customerOrderAmount;
  int supplierOrderAmount;
  int orderAmount;
  int orderCount;

  OrderAnalytics({
    required this.customerOrderAmount,
    required this.supplierOrderAmount,
    required this.orderAmount,
    required this.orderCount,
  });

  factory OrderAnalytics.fromJson(Map<String, dynamic> json) => OrderAnalytics(
        customerOrderAmount: json["customer_order_amount"],
        supplierOrderAmount: json["supplier_order_amount"],
        orderAmount: json["order_amount"],
        orderCount: json["order_count"],
      );

  Map<String, dynamic> toJson() => {
        "customer_order_amount": customerOrderAmount,
        "supplier_order_amount": supplierOrderAmount,
        "order_amount": orderAmount,
        "order_count": orderCount,
      };
}

class OutstandingAnalytics {
  String accountName;
  int totalOutstandingAmt;
  int totalInvoiceAmt;
  int totalDueAmount;
  int totalOverdueAmount;

  OutstandingAnalytics({
    required this.accountName,
    required this.totalOutstandingAmt,
    required this.totalInvoiceAmt,
    required this.totalDueAmount,
    required this.totalOverdueAmount,
  });

  factory OutstandingAnalytics.fromJson(Map<String, dynamic> json) =>
      OutstandingAnalytics(
        accountName: json["account_name"],
        totalOutstandingAmt: json["total_outstanding_amt"],
        totalInvoiceAmt: json["total_invoice_amt"],
        totalDueAmount: json["total_due_amount"],
        totalOverdueAmount: json["total_overdue_amount"],
      );

  Map<String, dynamic> toJson() => {
        "account_name": accountName,
        "total_outstanding_amt": totalOutstandingAmt,
        "total_invoice_amt": totalInvoiceAmt,
        "total_due_amount": totalDueAmount,
        "total_overdue_amount": totalOverdueAmount,
      };
}
