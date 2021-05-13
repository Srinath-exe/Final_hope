// To parse this JSON data, do
//
//     final getCouponDetails = getCouponDetailsFromJson(jsonString);

import 'dart:convert';

GetCouponDetails getCouponDetailsFromJson(String str) => GetCouponDetails.fromJson(json.decode(str));

String getCouponDetailsToJson(GetCouponDetails data) => json.encode(data.toJson());

class GetCouponDetails {
    GetCouponDetails({
        this.slno,
        this.cpnId,
        this.cpnName,
        this.cpnNumber,
        this.cpnAmount,
        this.cpnStrtdate,
        this.cpnEnddate,
        this.cpnStatus,
        this.cpnCreatedAt,
        this.cpnUpdatedAt,
    });

    String slno;
    String cpnId;
    String cpnName;
    String cpnNumber;
    String cpnAmount;
    DateTime cpnStrtdate;
    DateTime cpnEnddate;
    String cpnStatus;
    DateTime cpnCreatedAt;
    DateTime cpnUpdatedAt;

    factory GetCouponDetails.fromJson(Map<String, dynamic> json) => GetCouponDetails(
        slno: json["slno"],
        cpnId: json["cpn_id"],
        cpnName: json["cpn_name"],
        cpnNumber: json["cpn_number"],
        cpnAmount: json["cpn_amount"],
        cpnStrtdate: DateTime.parse(json["cpn_strtdate"]),
        cpnEnddate: DateTime.parse(json["cpn_enddate"]),
        cpnStatus: json["cpn_status"],
        cpnCreatedAt: DateTime.parse(json["cpn_createdAt"]),
        cpnUpdatedAt: DateTime.parse(json["cpn_updatedAt"]),
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
        "cpn_createdAt": cpnCreatedAt.toIso8601String(),
        "cpn_updatedAt": cpnUpdatedAt.toIso8601String(),
    };
}
