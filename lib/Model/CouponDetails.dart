// To parse this JSON data, do
//
//     final getCouponDetails = getCouponDetailsFromJson(jsonString);

import 'dart:convert';

GetCouponDetails getCouponDetailsFromJson(String str) => GetCouponDetails.fromJson(json.decode(str));

String getCouponDetailsToJson(GetCouponDetails data) => json.encode(data.toJson());

class GetCouponDetails {
    GetCouponDetails();

    factory GetCouponDetails.fromJson(Map<String, dynamic> json) => GetCouponDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
