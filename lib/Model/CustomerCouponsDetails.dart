// To parse this JSON data, do
//
//     final getCustomerCouponsDetails = getCustomerCouponsDetailsFromJson(jsonString);

import 'dart:convert';

GetCustomerCouponsDetails getCustomerCouponsDetailsFromJson(String str) => GetCustomerCouponsDetails.fromJson(json.decode(str));

String getCustomerCouponsDetailsToJson(GetCustomerCouponsDetails data) => json.encode(data.toJson());

class GetCustomerCouponsDetails {
    GetCustomerCouponsDetails();

    factory GetCustomerCouponsDetails.fromJson(Map<String, dynamic> json) => GetCustomerCouponsDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
