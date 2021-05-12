// To parse this JSON data, do
//
//     final getBrandDetails = getBrandDetailsFromJson(jsonString);

import 'dart:convert';

GetBrandDetails getBrandDetailsFromJson(String str) => GetBrandDetails.fromJson(json.decode(str));

String getBrandDetailsToJson(GetBrandDetails data) => json.encode(data.toJson());

class GetBrandDetails {
    GetBrandDetails();

    factory GetBrandDetails.fromJson(Map<String, dynamic> json) => GetBrandDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
