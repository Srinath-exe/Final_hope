// To parse this JSON data, do
//
//     final getCouponList = getCouponListFromJson(jsonString);

import 'dart:convert';

GetCouponList getCouponListFromJson(String str) => GetCouponList.fromJson(json.decode(str));

String getCouponListToJson(GetCouponList data) => json.encode(data.toJson());

class GetCouponList {
    GetCouponList();

    factory GetCouponList.fromJson(Map<String, dynamic> json) => GetCouponList(
    );

    Map<String, dynamic> toJson() => {
    };
}
