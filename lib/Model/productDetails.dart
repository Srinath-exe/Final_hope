// To parse this JSON data, do
//
//     final getProductDetails = getProductDetailsFromJson(jsonString);

import 'dart:convert';

GetProductDetails getProductDetailsFromJson(String str) => GetProductDetails.fromJson(json.decode(str));

String getProductDetailsToJson(GetProductDetails data) => json.encode(data.toJson());

class GetProductDetails {
    GetProductDetails();

    factory GetProductDetails.fromJson(Map<String, dynamic> json) => GetProductDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
