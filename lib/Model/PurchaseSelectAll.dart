// To parse this JSON data, do
//
//     final getPurchasesSelectAll = getPurchasesSelectAllFromJson(jsonString);

import 'dart:convert';

List<GetPurchasesSelectAll> getPurchasesSelectAllFromJson(String str) => List<GetPurchasesSelectAll>.from(json.decode(str).map((x) => GetPurchasesSelectAll.fromJson(x)));

String getPurchasesSelectAllToJson(List<GetPurchasesSelectAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetPurchasesSelectAll {
    GetPurchasesSelectAll({
        this.prcId,
        this.prcUserid,
        this.prcMobile,
        this.prcStoreid,
        this.prcCashierid,
        this.prcStrtdate,
        this.prcInvoice,
        this.prcCoupon,
        this.prcPointspent,
        this.prcAmountpaid,
        this.prcStatus,
        this.usrFname,
        this.usrLname,
        this.strName,
    });

    String prcId;
    String prcUserid;
    String prcMobile;
    String prcStoreid;
    String prcCashierid;
    DateTime prcStrtdate;
    String prcInvoice;
    String prcCoupon;
    String prcPointspent;
    String prcAmountpaid;
    String prcStatus;
    String usrFname;
    String usrLname;
    String strName;

    factory GetPurchasesSelectAll.fromJson(Map<String, dynamic> json) => GetPurchasesSelectAll(
        prcId: json["prc_id"],
        prcUserid: json["prc_userid"],
        prcMobile: json["prc_mobile"],
        prcStoreid: json["prc_storeid"],
        prcCashierid: json["prc_cashierid"],
        prcStrtdate: DateTime.parse(json["prc_strtdate"]),
        prcInvoice: json["prc_invoice"],
        prcCoupon: json["prc_coupon"],
        prcPointspent: json["prc_pointspent"],
        prcAmountpaid: json["prc_amountpaid"],
        prcStatus: json["prc_status"],
        usrFname: json["usr_fname"],
        usrLname: json["usr_lname"],
        strName: json["str_name"],
    );

    Map<String, dynamic> toJson() => {
        "prc_id": prcId,
        "prc_userid": prcUserid,
        "prc_mobile": prcMobile,
        "prc_storeid": prcStoreid,
        "prc_cashierid": prcCashierid,
        "prc_strtdate": "${prcStrtdate.year.toString().padLeft(4, '0')}-${prcStrtdate.month.toString().padLeft(2, '0')}-${prcStrtdate.day.toString().padLeft(2, '0')}",
        "prc_invoice": prcInvoice,
        "prc_coupon": prcCoupon,
        "prc_pointspent": prcPointspent,
        "prc_amountpaid": prcAmountpaid,
        "prc_status": prcStatus,
        "usr_fname": usrFname,
        "usr_lname": usrLname,
        "str_name": strName,
    };
}
