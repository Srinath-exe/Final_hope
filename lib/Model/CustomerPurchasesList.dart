// To parse this JSON data, do
//
//     final getCustomerPurchasesList = getCustomerPurchasesListFromJson(jsonString);

import 'dart:convert';

List<GetCustomerPurchasesList> getCustomerPurchasesListFromJson(String str) => List<GetCustomerPurchasesList>.from(json.decode(str).map((x) => GetCustomerPurchasesList.fromJson(x)));

String getCustomerPurchasesListToJson(List<GetCustomerPurchasesList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCustomerPurchasesList {
    GetCustomerPurchasesList({
        this.prcId,
        this.prcUserid,
        this.prcMobile,
        this.prcStoreid,
        this.prcCashierid,
        this.prcStrtdate,
    });

    String prcId;
    String prcUserid;
    String prcMobile;
    String prcStoreid;
    String prcCashierid;
    DateTime prcStrtdate;

    factory GetCustomerPurchasesList.fromJson(Map<String, dynamic> json) => GetCustomerPurchasesList(
        prcId: json["prc_id"],
        prcUserid: json["prc_userid"],
        prcMobile: json["prc_mobile"],
        prcStoreid: json["prc_storeid"],
        prcCashierid: json["prc_cashierid"],
        prcStrtdate: DateTime.parse(json["prc_strtdate"]),
    );

    Map<String, dynamic> toJson() => {
        "prc_id": prcId,
        "prc_userid": prcUserid,
        "prc_mobile": prcMobile,
        "prc_storeid": prcStoreid,
        "prc_cashierid": prcCashierid,
        "prc_strtdate": "${prcStrtdate.year.toString().padLeft(4, '0')}-${prcStrtdate.month.toString().padLeft(2, '0')}-${prcStrtdate.day.toString().padLeft(2, '0')}",
    };
}
