// To parse this JSON data, do
//
//     final getOffersDetails = getOffersDetailsFromJson(jsonString);

import 'dart:convert';

GetOffersDetails getOffersDetailsFromJson(String str) => GetOffersDetails.fromJson(json.decode(str));

String getOffersDetailsToJson(GetOffersDetails data) => json.encode(data.toJson());

class GetOffersDetails {
    GetOffersDetails();

    factory GetOffersDetails.fromJson(Map<String, dynamic> json) => GetOffersDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
