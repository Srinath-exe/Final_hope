// To parse this JSON data, do
//
//     final getCustomerCouponsList = getCustomerCouponsListFromJson(jsonString);

import 'dart:convert';

GetCustomerCouponsList getCustomerCouponsListFromJson(String str) => GetCustomerCouponsList.fromJson(json.decode(str));

String getCustomerCouponsListToJson(GetCustomerCouponsList data) => json.encode(data.toJson());

class GetCustomerCouponsList {
    GetCustomerCouponsList();

    factory GetCustomerCouponsList.fromJson(Map<String, dynamic> json) => GetCustomerCouponsList(
    );

    Map<String, dynamic> toJson() => {
    };
}
