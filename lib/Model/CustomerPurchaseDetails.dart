// To parse this JSON data, do
//
//     final getCustomerPurchaseDetails = getCustomerPurchaseDetailsFromJson(jsonString);

import 'dart:convert';

GetCustomerPurchaseDetails getCustomerPurchaseDetailsFromJson(String str) =>
    GetCustomerPurchaseDetails.fromJson(json.decode(str));

String getCustomerPurchaseDetailsToJson(GetCustomerPurchaseDetails data) =>
    json.encode(data.toJson());

class GetCustomerPurchaseDetails {
  GetCustomerPurchaseDetails({
    this.slno,
    this.prcId,
    this.prcUserid,
    this.prcMobile,
    this.prcStoreid,
    this.prcCashierid,
    this.prcInvoice,
    this.prcCoupon,
    this.prcPointspent,
    this.prcAmountpaid,
    this.prcStatus,
  });

  String slno;
  String prcId;
  String prcUserid;
  String prcMobile;
  String prcStoreid;
  String prcCashierid;

  String prcInvoice;
  String prcCoupon;
  String prcPointspent;
  String prcAmountpaid;
  String prcStatus;

  factory GetCustomerPurchaseDetails.fromJson(Map<String, dynamic> json) =>
      GetCustomerPurchaseDetails(
        slno: json["slno"],
        prcId: json["prc_id"],
        prcUserid: json["prc_userid"],
        prcMobile: json["prc_mobile"],
        prcStoreid: json["prc_storeid"],
        prcCashierid: json["prc_cashierid"],
        prcInvoice: json["prc_invoice"],
        prcCoupon: json["prc_coupon"],
        prcPointspent: json["prc_pointspent"],
        prcAmountpaid: json["prc_amountpaid"],
        prcStatus: json["prc_status"],
      );

  Map<String, dynamic> toJson() => {
        "slno": slno,
        "prc_id": prcId,
        "prc_userid": prcUserid,
        "prc_mobile": prcMobile,
        "prc_storeid": prcStoreid,
        "prc_cashierid": prcCashierid,
        "prc_invoice": prcInvoice,
        "prc_coupon": prcCoupon,
        "prc_pointspent": prcPointspent,
        "prc_amountpaid": prcAmountpaid,
        "prc_status": prcStatus,
      };
}
