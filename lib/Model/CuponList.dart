// To parse this JSON data, do
//
//     final getCouponList = getCouponListFromJson(jsonString);

import 'dart:convert';

List<GetCouponList> getCouponListFromJson(String str) => List<GetCouponList>.from(json.decode(str).map((x) => GetCouponList.fromJson(x)));

String getCouponListToJson(List<GetCouponList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetCouponList {
    GetCouponList({
        this.slno,
        this.cpnId,
        this.cpnName,
        this.cpnNumber,
        this.cpnAmount,
        this.cpnStrtdate,
        this.cpnEnddate,
        this.cpnStatus,
    });

    String slno;
    String cpnId;
    String cpnName;
    String cpnNumber;
    String cpnAmount;
    DateTime cpnStrtdate;
    DateTime cpnEnddate;
    String cpnStatus;

    factory GetCouponList.fromJson(Map<String, dynamic> json) => GetCouponList(
        slno: json["slno"],
        cpnId: json["cpn_id"],
        cpnName: json["cpn_name"],
        cpnNumber: json["cpn_number"],
        cpnAmount: json["cpn_amount"],
        cpnStrtdate: DateTime.parse(json["cpn_strtdate"]),
        cpnEnddate: DateTime.parse(json["cpn_enddate"]),
        cpnStatus: json["cpn_status"],
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "cpn_id": cpnId,
        "cpn_name": cpnName,
        "cpn_number": cpnNumber,
        "cpn_amount": cpnAmount,
        "cpn_strtdate": "${cpnStrtdate.year.toString().padLeft(4, '0')}-${cpnStrtdate.month.toString().padLeft(2, '0')}-${cpnStrtdate.day.toString().padLeft(2, '0')}",
        "cpn_enddate": "${cpnEnddate.year.toString().padLeft(4, '0')}-${cpnEnddate.month.toString().padLeft(2, '0')}-${cpnEnddate.day.toString().padLeft(2, '0')}",
        "cpn_status": cpnStatus,
    };
}
