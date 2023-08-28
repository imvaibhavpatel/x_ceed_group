// To parse this JSON data, do
//
//     final orderListModel = orderListModelFromJson(jsonString);

import 'dart:convert';

OrderListModel orderListModelFromJson(String str) => OrderListModel.fromJson(json.decode(str));

String orderListModelToJson(OrderListModel data) => json.encode(data.toJson());

class OrderListModel {
  bool status;
  List<OrderList> orderList;
  String page;
  int totalPages;
  int totalOrders;
  List<MonthlyOrder> monthlyOrders;

  OrderListModel({
    required this.status,
    required this.orderList,
    required this.page,
    required this.totalPages,
    required this.totalOrders,
    required this.monthlyOrders,
  });

  factory OrderListModel.fromJson(Map<String, dynamic> json) => OrderListModel(
    status: json["status"],
    orderList: json["order_list"] != null ? List<OrderList>.from(json["order_list"].map((x) => OrderList.fromJson(x))) : [],
    page: json["page"].toString(),
    totalPages: json["total_pages"] ?? 0,
    totalOrders: json["total_orders"] ?? 0,
    monthlyOrders: json["monthly_orders"] != null ? List<MonthlyOrder>.from(json["monthly_orders"].map((x) => MonthlyOrder.fromJson(x))) : [],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "order_list": List<dynamic>.from(orderList.map((x) => x.toJson())),
    "page": page,
    "total_pages": totalPages,
    "total_orders": totalOrders,
    "monthly_orders": List<dynamic>.from(monthlyOrders.map((x) => x.toJson())),
  };
}

class MonthlyOrder {
  int ordId;
  int compId;
  int orgId;
  dynamic isOrdedit;
  int custId;
  int supId;
  int buyerAccountId;
  dynamic supplierAccountId;
  int sellerAccountId;
  int supAssigned;
  dynamic visitId;
  dynamic remoteId;
  dynamic custSupActivityGroupId;
  dynamic callLogId;
  int userId;
  int pendingQty;
  double amount;
  double totalgstAmount;
  dynamic shippingCharge;
  dynamic handlingCharge;
  dynamic totalHandlingCharge;
  dynamic handlingChargeType;
  double beforeDiscountAmount;
  double beforeGstAdditionAmount;
  dynamic totalAmountSaved;
  dynamic latitude;
  dynamic longitude;
  dynamic transportationBy;
  dynamic comments;
  dynamic otherComments;
  String deliveryAddress;
  String status;
  String visibilityStatus;
  String orderStatus;
  int addBy;
  int mdfBy;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic expectedDeliveryDate;
  dynamic discountType;
  int discountPecentage;
  int discountValue;
  dynamic generalDiscountAmount;
  String schemeDiscountType;
  int schemeDiscountValue;
  int schemeDiscountPercentage;
  int schemeDiscountAmount;
  dynamic custSupDiscountType;
  int custSupDiscountPercentage;
  int custSupDiscountValue;
  dynamic custSupDiscountAmount;
  String activityVerify;
  dynamic termConditions;
  int compOrdId;
  dynamic orderWeight;
  String orderSource;
  String retailerType;
  String paymentStatus;
  int orderamountSchemeId;
  dynamic otype;
  dynamic orderType;
  dynamic nbFb;

  MonthlyOrder({
    required this.ordId,
    required this.compId,
    required this.orgId,
    required this.isOrdedit,
    required this.custId,
    required this.supId,
    required this.buyerAccountId,
    required this.supplierAccountId,
    required this.sellerAccountId,
    required this.supAssigned,
    required this.visitId,
    required this.remoteId,
    required this.custSupActivityGroupId,
    required this.callLogId,
    required this.userId,
    required this.pendingQty,
    required this.amount,
    required this.totalgstAmount,
    required this.shippingCharge,
    required this.handlingCharge,
    required this.totalHandlingCharge,
    required this.handlingChargeType,
    required this.beforeDiscountAmount,
    required this.beforeGstAdditionAmount,
    required this.totalAmountSaved,
    required this.latitude,
    required this.longitude,
    required this.transportationBy,
    required this.comments,
    required this.otherComments,
    required this.deliveryAddress,
    required this.status,
    required this.visibilityStatus,
    required this.orderStatus,
    required this.addBy,
    required this.mdfBy,
    required this.createdAt,
    required this.updatedAt,
    required this.expectedDeliveryDate,
    required this.discountType,
    required this.discountPecentage,
    required this.discountValue,
    required this.generalDiscountAmount,
    required this.schemeDiscountType,
    required this.schemeDiscountValue,
    required this.schemeDiscountPercentage,
    required this.schemeDiscountAmount,
    required this.custSupDiscountType,
    required this.custSupDiscountPercentage,
    required this.custSupDiscountValue,
    required this.custSupDiscountAmount,
    required this.activityVerify,
    required this.termConditions,
    required this.compOrdId,
    required this.orderWeight,
    required this.orderSource,
    required this.retailerType,
    required this.paymentStatus,
    required this.orderamountSchemeId,
    required this.otype,
    required this.orderType,
    required this.nbFb,
  });

  factory MonthlyOrder.fromJson(Map<String, dynamic> json) => MonthlyOrder(
    ordId: json["ord_id"],
    compId: json["comp_id"],
    orgId: json["org_id"],
    isOrdedit: json["is_ordedit"],
    custId: json["cust_id"],
    supId: json["sup_id"],
    buyerAccountId: json["buyer_account_id"],
    supplierAccountId: json["supplier_account_id"],
    sellerAccountId: json["seller_account_id"],
    supAssigned: json["sup_assigned"],
    visitId: json["visit_id"],
    remoteId: json["remote_id"],
    custSupActivityGroupId: json["cust_sup_activity_group_id"],
    callLogId: json["call_log_id"],
    userId: json["user_id"],
    pendingQty: json["pending_qty"],
    amount: json["amount"]?.toDouble(),
    totalgstAmount: json["totalgst_amount"]?.toDouble(),
    shippingCharge: json["shipping_charge"],
    handlingCharge: json["handling_charge"],
    totalHandlingCharge: json["total_handling_charge"],
    handlingChargeType: json["handling_charge_type"],
    beforeDiscountAmount: json["before_discount_amount"]?.toDouble(),
    beforeGstAdditionAmount: json["before_gst_addition_amount"]?.toDouble(),
    totalAmountSaved: json["total_amount_saved"],
    latitude: json["latitude"],
    longitude: json["longitude"],
    transportationBy: json["transportation_by"],
    comments: json["comments"],
    otherComments: json["other_comments"],
    deliveryAddress: json["delivery_address"],
    status: json["status"],
    visibilityStatus: json["visibility_status"],
    orderStatus: json["order_status"],
    addBy: json["add_by"],
    mdfBy: json["mdf_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expectedDeliveryDate: json["expected_delivery_date"],
    discountType: json["discount_type"],
    discountPecentage: json["discount_pecentage"],
    discountValue: json["discount_value"],
    generalDiscountAmount: json["general_discount_amount"],
    schemeDiscountType: json["scheme_discount_type"],
    schemeDiscountValue: json["scheme_discount_value"],
    schemeDiscountPercentage: json["scheme_discount_percentage"],
    schemeDiscountAmount: json["scheme_discount_amount"],
    custSupDiscountType: json["cust_sup_discount_type"],
    custSupDiscountPercentage: json["cust_sup_discount_percentage"],
    custSupDiscountValue: json["cust_sup_discount_value"],
    custSupDiscountAmount: json["cust_sup_discount_amount"],
    activityVerify: json["activity_verify"],
    termConditions: json["term_conditions"],
    compOrdId: json["comp_ord_id"],
    orderWeight: json["order_weight"],
    orderSource: json["order_source"],
    retailerType: json["retailer_type"],
    paymentStatus: json["payment_status"],
    orderamountSchemeId: json["orderamount_schemeId"],
    otype: json["otype"],
    orderType: json["Order_Type"],
    nbFb: json["NB_FB"],
  );

  Map<String, dynamic> toJson() => {
    "ord_id": ordId,
    "comp_id": compId,
    "org_id": orgId,
    "is_ordedit": isOrdedit,
    "cust_id": custId,
    "sup_id": supId,
    "buyer_account_id": buyerAccountId,
    "supplier_account_id": supplierAccountId,
    "seller_account_id": sellerAccountId,
    "sup_assigned": supAssigned,
    "visit_id": visitId,
    "remote_id": remoteId,
    "cust_sup_activity_group_id": custSupActivityGroupId,
    "call_log_id": callLogId,
    "user_id": userId,
    "pending_qty": pendingQty,
    "amount": amount,
    "totalgst_amount": totalgstAmount,
    "shipping_charge": shippingCharge,
    "handling_charge": handlingCharge,
    "total_handling_charge": totalHandlingCharge,
    "handling_charge_type": handlingChargeType,
    "before_discount_amount": beforeDiscountAmount,
    "before_gst_addition_amount": beforeGstAdditionAmount,
    "total_amount_saved": totalAmountSaved,
    "latitude": latitude,
    "longitude": longitude,
    "transportation_by": transportationBy,
    "comments": comments,
    "other_comments": otherComments,
    "delivery_address": deliveryAddress,
    "status": status,
    "visibility_status": visibilityStatus,
    "order_status": orderStatus,
    "add_by": addBy,
    "mdf_by": mdfBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expected_delivery_date": expectedDeliveryDate,
    "discount_type": discountType,
    "discount_pecentage": discountPecentage,
    "discount_value": discountValue,
    "general_discount_amount": generalDiscountAmount,
    "scheme_discount_type": schemeDiscountType,
    "scheme_discount_value": schemeDiscountValue,
    "scheme_discount_percentage": schemeDiscountPercentage,
    "scheme_discount_amount": schemeDiscountAmount,
    "cust_sup_discount_type": custSupDiscountType,
    "cust_sup_discount_percentage": custSupDiscountPercentage,
    "cust_sup_discount_value": custSupDiscountValue,
    "cust_sup_discount_amount": custSupDiscountAmount,
    "activity_verify": activityVerify,
    "term_conditions": termConditions,
    "comp_ord_id": compOrdId,
    "order_weight": orderWeight,
    "order_source": orderSource,
    "retailer_type": retailerType,
    "payment_status": paymentStatus,
    "orderamount_schemeId": orderamountSchemeId,
    "otype": otype,
    "Order_Type": orderType,
    "NB_FB": nbFb,
  };
}

class OrderList {
  int? ordId;
  double? amount;
  DateTime? createdAt;
  int? orderId;
  String? status;
  String? totalQty;
  int? productVariantId;
  int? totalOrderQty;
  List<int>? productId;

  OrderList({
     this.ordId,
     this.amount,
     this.createdAt,
     this.orderId,
     this.status,
     this.totalQty,
     this.productVariantId,
     this.totalOrderQty,
     this.productId,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    ordId: json["ord_id"],
    amount: json["amount"]?.toDouble(),
    createdAt: DateTime.parse(json["created_at"]),
    orderId: json["order_id"],
    status: json["status"],
    totalQty: json["total_qty"],
    productVariantId: json["product_variant_id"],
    totalOrderQty: json["total_order_qty"],
    productId: List<int>.from(json["product_id"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "ord_id": ordId,
    "amount": amount,
    "created_at": createdAt?.toIso8601String(),
    "order_id": orderId,
    "status": status,
    "total_qty": totalQty,
    "product_variant_id": productVariantId,
    "total_order_qty": totalOrderQty,
    "product_id": List<dynamic>.from(productId!.map((x) => x)),
  };
}
