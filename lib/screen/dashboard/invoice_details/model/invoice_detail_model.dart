// To parse this JSON data, do
//
//     final invoiceDetailModel = invoiceDetailModelFromJson(jsonString);

import 'dart:convert';

InvoiceDetailModel invoiceDetailModelFromJson(String str) => InvoiceDetailModel.fromJson(json.decode(str));

String invoiceDetailModelToJson(InvoiceDetailModel data) => json.encode(data.toJson());

class InvoiceDetailModel {
  bool? status;
  String? message;
  InvoiceDetails? invoiceDetails;
  dynamic invoiceDispatchDetails;

  InvoiceDetailModel({
     this.status,
     this.message,
     this.invoiceDetails,
     this.invoiceDispatchDetails,
  });

  factory InvoiceDetailModel.fromJson(Map<String, dynamic> json) => InvoiceDetailModel(
    status: json["status"],
    message: json["message"],
    invoiceDetails: InvoiceDetails.fromJson(json["invoice_details"]),
    invoiceDispatchDetails: json["invoice_dispatch_details"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "invoice_details": invoiceDetails?.toJson() ,
    "invoice_dispatch_details": invoiceDispatchDetails,
  };
}

class InvoiceDetails {
  int invoiceId;
  String seriesInvoiceId;
  int custSupId;
  String custSupType;
  int accountId;
  int visitId;
  int remoteId;
  int callLogId;
  String deliveryAddress;
  int supplierAssigned;
  int accountSupplierAssigned;
  int compId;
  int orgId;
  String termsConditions;
  String comments;
  double totalAmount;
  int paidAmount;
  double pendingAmount;
  double totalgstAmount;
  int shippingCharge;
  int handlingCharge;
  int totalHandlingCharge;
  String handlingChargeType;
  double beforeDiscountAmount;
  double beforeGstAdditionAmount;
  String generalDiscountType;
  int generalDiscountPercentage;
  int generalDiscountValue;
  int generalDiscountAmount;
  String schemeDiscountType;
  int schemeDiscountPercentage;
  int schemeDiscountValue;
  int schemeDiscountAmount;
  String custSupDiscountType;
  int custSupDiscountPercentage;
  int custSupDiscountValue;
  int custSupDiscountAmount;
  int addBy;
  dynamic mdfBy;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime expectedDeliveryDate;
  DateTime invoiceDate;
  dynamic dueDate;
  String status;
  String visibilityStatus;
  int salesmanId;
  int compInvoiceId;
  String invoiceSource;
  String invoiceSourceId;
  dynamic tallySupId;
  dynamic invoiceConversion;
  String accountName;
  String retailerPhoneNumber;
  String retailerAccountAddress;
  dynamic retailerGstNo;
  String sellerAccountName;
  dynamic sellerAccountAddress;
  dynamic sellerPhoneNumber;
  dynamic sellerGstNo;
  String userName;
  String shippingAddress;
  String billingAddress;
  String orderedProductTotalQty;
  int orderedProductCount;
  String paymentMethod;
  List<InvoiceMeta> invoiceMeta;

  InvoiceDetails({
    required this.invoiceId,
    required this.seriesInvoiceId,
    required this.custSupId,
    required this.custSupType,
    required this.accountId,
    required this.visitId,
    required this.remoteId,
    required this.callLogId,
    required this.deliveryAddress,
    required this.supplierAssigned,
    required this.accountSupplierAssigned,
    required this.compId,
    required this.orgId,
    required this.termsConditions,
    required this.comments,
    required this.totalAmount,
    required this.paidAmount,
    required this.pendingAmount,
    required this.totalgstAmount,
    required this.shippingCharge,
    required this.handlingCharge,
    required this.totalHandlingCharge,
    required this.handlingChargeType,
    required this.beforeDiscountAmount,
    required this.beforeGstAdditionAmount,
    required this.generalDiscountType,
    required this.generalDiscountPercentage,
    required this.generalDiscountValue,
    required this.generalDiscountAmount,
    required this.schemeDiscountType,
    required this.schemeDiscountPercentage,
    required this.schemeDiscountValue,
    required this.schemeDiscountAmount,
    required this.custSupDiscountType,
    required this.custSupDiscountPercentage,
    required this.custSupDiscountValue,
    required this.custSupDiscountAmount,
    required this.addBy,
    required this.mdfBy,
    required this.createdAt,
    required this.updatedAt,
    required this.expectedDeliveryDate,
    required this.invoiceDate,
    required this.dueDate,
    required this.status,
    required this.visibilityStatus,
    required this.salesmanId,
    required this.compInvoiceId,
    required this.invoiceSource,
    required this.invoiceSourceId,
    required this.tallySupId,
    required this.invoiceConversion,
    required this.accountName,
    required this.retailerPhoneNumber,
    required this.retailerAccountAddress,
    required this.retailerGstNo,
    required this.sellerAccountName,
    required this.sellerAccountAddress,
    required this.sellerPhoneNumber,
    required this.sellerGstNo,
    required this.userName,
    required this.shippingAddress,
    required this.billingAddress,
    required this.orderedProductTotalQty,
    required this.orderedProductCount,
    required this.paymentMethod,
    required this.invoiceMeta,
  });

  factory InvoiceDetails.fromJson(Map<String, dynamic> json) => InvoiceDetails(
    invoiceId: json["invoice_id"],
    seriesInvoiceId: json["series_invoice_id"],
    custSupId: json["cust_sup_id"],
    custSupType: json["cust_sup_type"],
    accountId: json["account_id"],
    visitId: json["visit_id"],
    remoteId: json["remote_id"],
    callLogId: json["call_log_id"],
    deliveryAddress: json["delivery_address"],
    supplierAssigned: json["supplier_assigned"],
    accountSupplierAssigned: json["account_supplier_assigned"],
    compId: json["comp_id"],
    orgId: json["org_id"],
    termsConditions: json["terms_conditions"] ?? "",
    comments: json["comments"],
    totalAmount: json["total_amount"]?.toDouble(),
    paidAmount: json["paid_amount"],
    pendingAmount: json["pending_amount"]?.toDouble(),
    totalgstAmount: json["totalgst_amount"]?.toDouble(),
    shippingCharge: json["shipping_charge"],
    handlingCharge: json["handling_charge"],
    totalHandlingCharge: json["total_handling_charge"],
    handlingChargeType: json["handling_charge_type"],
    beforeDiscountAmount: json["before_discount_amount"].toDouble(),
    beforeGstAdditionAmount: json["before_gst_addition_amount"].toDouble(),
    generalDiscountType: json["general_discount_type"],
    generalDiscountPercentage: json["general_discount_percentage"],
    generalDiscountValue: json["general_discount_value"],
    generalDiscountAmount: json["general_discount_amount"],
    schemeDiscountType: json["scheme_discount_type"],
    schemeDiscountPercentage: json["scheme_discount_percentage"],
    schemeDiscountValue: json["scheme_discount_value"],
    schemeDiscountAmount: json["scheme_discount_amount"],
    custSupDiscountType: json["cust_sup_discount_type"],
    custSupDiscountPercentage: json["cust_sup_discount_percentage"],
    custSupDiscountValue: json["cust_sup_discount_value"],
    custSupDiscountAmount: json["cust_sup_discount_amount"],
    addBy: json["add_by"],
    mdfBy: json["mdf_by"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    expectedDeliveryDate: DateTime.parse(json["expected_delivery_date"]),
    invoiceDate: DateTime.parse(json["invoice_date"]),
    dueDate: json["due_date"],
    status: json["status"],
    visibilityStatus: json["visibility_status"],
    salesmanId: json["salesman_id"],
    compInvoiceId: json["comp_invoice_id"],
    invoiceSource: json["invoice_source"],
    invoiceSourceId: json["invoice_source_id"],
    tallySupId: json["tally_sup_id"],
    invoiceConversion: json["invoice_conversion"],
    accountName: json["account_name"],
    retailerPhoneNumber: json["retailer_phone_number"],
    retailerAccountAddress: json["retailer_account_address"],
    retailerGstNo: json["retailer_gst_no"],
    sellerAccountName: json["seller_account_name"],
    sellerAccountAddress: json["seller_account_address"],
    sellerPhoneNumber: json["seller_phone_number"],
    sellerGstNo: json["seller_gst_no"],
    userName: json["user_name"],
    shippingAddress: json["shipping_address"],
    billingAddress: json["billing_address"],
    orderedProductTotalQty: json["ordered_product_total_qty"],
    orderedProductCount: json["ordered_product_count"],
    paymentMethod: json["payment_method"],
    invoiceMeta: List<InvoiceMeta>.from(json["invoice_meta"].map((x) => InvoiceMeta.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "invoice_id": invoiceId,
    "series_invoice_id": seriesInvoiceId,
    "cust_sup_id": custSupId,
    "cust_sup_type": custSupType,
    "account_id": accountId,
    "visit_id": visitId,
    "remote_id": remoteId,
    "call_log_id": callLogId,
    "delivery_address": deliveryAddress,
    "supplier_assigned": supplierAssigned,
    "account_supplier_assigned": accountSupplierAssigned,
    "comp_id": compId,
    "org_id": orgId,
    "terms_conditions": termsConditions,
    "comments": comments,
    "total_amount": totalAmount,
    "paid_amount": paidAmount,
    "pending_amount": pendingAmount,
    "totalgst_amount": totalgstAmount,
    "shipping_charge": shippingCharge,
    "handling_charge": handlingCharge,
    "total_handling_charge": totalHandlingCharge,
    "handling_charge_type": handlingChargeType,
    "before_discount_amount": beforeDiscountAmount,
    "before_gst_addition_amount": beforeGstAdditionAmount,
    "general_discount_type": generalDiscountType,
    "general_discount_percentage": generalDiscountPercentage,
    "general_discount_value": generalDiscountValue,
    "general_discount_amount": generalDiscountAmount,
    "scheme_discount_type": schemeDiscountType,
    "scheme_discount_percentage": schemeDiscountPercentage,
    "scheme_discount_value": schemeDiscountValue,
    "scheme_discount_amount": schemeDiscountAmount,
    "cust_sup_discount_type": custSupDiscountType,
    "cust_sup_discount_percentage": custSupDiscountPercentage,
    "cust_sup_discount_value": custSupDiscountValue,
    "cust_sup_discount_amount": custSupDiscountAmount,
    "add_by": addBy,
    "mdf_by": mdfBy,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "expected_delivery_date": expectedDeliveryDate.toIso8601String(),
    "invoice_date": "${invoiceDate.year.toString().padLeft(4, '0')}-${invoiceDate.month.toString().padLeft(2, '0')}-${invoiceDate.day.toString().padLeft(2, '0')}",
    "due_date": dueDate,
    "status": status,
    "visibility_status": visibilityStatus,
    "salesman_id": salesmanId,
    "comp_invoice_id": compInvoiceId,
    "invoice_source": invoiceSource,
    "invoice_source_id": invoiceSourceId,
    "tally_sup_id": tallySupId,
    "invoice_conversion": invoiceConversion,
    "account_name": accountName,
    "retailer_phone_number": retailerPhoneNumber,
    "retailer_account_address": retailerAccountAddress,
    "retailer_gst_no": retailerGstNo,
    "seller_account_name": sellerAccountName,
    "seller_account_address": sellerAccountAddress,
    "seller_phone_number": sellerPhoneNumber,
    "seller_gst_no": sellerGstNo,
    "user_name": userName,
    "shipping_address": shippingAddress,
    "billing_address": billingAddress,
    "ordered_product_total_qty": orderedProductTotalQty,
    "ordered_product_count": orderedProductCount,
    "payment_method": paymentMethod,
    "invoice_meta": List<dynamic>.from(invoiceMeta.map((x) => x.toJson())),
  };
}

class InvoiceMeta {
  int invoiceordMetadataId;
  int invoiceId;
  int productVariantId;
  int qty;
  double prodPrice;
  int casesQty;
  int unit;
  DateTime createdAt;
  dynamic updatedAt;
  int prodDiscountAmount;
  int discountedAmount;
  int orderDiscountedAmount;
  double productTotal;
  int productIgstprice;
  int productCgstprice;
  int productSgstprice;
  int prodGst;
  int cgst;
  int sgst;
  int productCatId;
  int productSubcatId;
  int price;
  int productId;
  dynamic brandName;
  String productVariantName;
  dynamic priceListMasterId;
  String sku;
  int mrp;
  String productCatName;
  String productName;
  List<dynamic> productImage;

  InvoiceMeta({
    required this.invoiceordMetadataId,
    required this.invoiceId,
    required this.productVariantId,
    required this.qty,
    required this.prodPrice,
    required this.casesQty,
    required this.unit,
    required this.createdAt,
    required this.updatedAt,
    required this.prodDiscountAmount,
    required this.discountedAmount,
    required this.orderDiscountedAmount,
    required this.productTotal,
    required this.productIgstprice,
    required this.productCgstprice,
    required this.productSgstprice,
    required this.prodGst,
    required this.cgst,
    required this.sgst,
    required this.productCatId,
    required this.productSubcatId,
    required this.price,
    required this.productId,
    required this.brandName,
    required this.productVariantName,
    required this.priceListMasterId,
    required this.sku,
    required this.mrp,
    required this.productCatName,
    required this.productName,
    required this.productImage,
  });

  factory InvoiceMeta.fromJson(Map<String, dynamic> json) => InvoiceMeta(
    invoiceordMetadataId: json["invoiceord_metadata_id"],
    invoiceId: json["invoice_id"],
    productVariantId: json["product_variant_id"],
    qty: json["qty"],
    prodPrice: json["prod_price"].toDouble(),
    casesQty: json["cases_qty"],
    unit: json["unit"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"],
    prodDiscountAmount: json["prod_discount_amount"],
    discountedAmount: json["discounted_amount"],
    orderDiscountedAmount: json["order_discounted_amount"],
    productTotal: json["product_total"].toDouble(),
    productIgstprice: json["product_igstprice"],
    productCgstprice: json["product_cgstprice"],
    productSgstprice: json["product_sgstprice"],
    prodGst: json["prod_gst"],
    cgst: json["cgst"],
    sgst: json["sgst"],
    productCatId: json["product_cat_id"],
    productSubcatId: json["product_subcat_id"],
    price: json["price"],
    productId: json["product_id"],
    brandName: json["brand_name"],
    productVariantName: json["product_variant_name"],
    priceListMasterId: json["price_list_master_id"],
    sku: json["sku"],
    mrp: json["mrp"],
    productCatName: json["product_cat_name"],
    productName: json["product_name"],
    productImage: List<dynamic>.from(json["product_image"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "invoiceord_metadata_id": invoiceordMetadataId,
    "invoice_id": invoiceId,
    "product_variant_id": productVariantId,
    "qty": qty,
    "prod_price": prodPrice,
    "cases_qty": casesQty,
    "unit": unit,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt,
    "prod_discount_amount": prodDiscountAmount,
    "discounted_amount": discountedAmount,
    "order_discounted_amount": orderDiscountedAmount,
    "product_total": productTotal,
    "product_igstprice": productIgstprice,
    "product_cgstprice": productCgstprice,
    "product_sgstprice": productSgstprice,
    "prod_gst": prodGst,
    "cgst": cgst,
    "sgst": sgst,
    "product_cat_id": productCatId,
    "product_subcat_id": productSubcatId,
    "price": price,
    "product_id": productId,
    "brand_name": brandName,
    "product_variant_name": productVariantName,
    "price_list_master_id": priceListMasterId,
    "sku": sku,
    "mrp": mrp,
    "product_cat_name": productCatName,
    "product_name": productName,
    "product_image": List<dynamic>.from(productImage.map((x) => x)),
  };
}
