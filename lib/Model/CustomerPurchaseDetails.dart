// To parse this JSON data, do
//
//     final getCustomerPurchaseDetails = getCustomerPurchaseDetailsFromJson(jsonString);

import 'dart:convert';

GetCustomerPurchaseDetails getCustomerPurchaseDetailsFromJson(String str) => GetCustomerPurchaseDetails.fromJson(json.decode(str));

String getCustomerPurchaseDetailsToJson(GetCustomerPurchaseDetails data) => json.encode(data.toJson());

class GetCustomerPurchaseDetails {
    GetCustomerPurchaseDetails();

    factory GetCustomerPurchaseDetails.fromJson(Map<String, dynamic> json) => GetCustomerPurchaseDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
