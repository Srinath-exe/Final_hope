// To parse this JSON data, do
//
//     final getOffersList = getOffersListFromJson(jsonString);

import 'dart:convert';

GetOffersList getOffersListFromJson(String str) => GetOffersList.fromJson(json.decode(str));

String getOffersListToJson(GetOffersList data) => json.encode(data.toJson());

class GetOffersList {
    GetOffersList();

    factory GetOffersList.fromJson(Map<String, dynamic> json) => GetOffersList(
    );

    Map<String, dynamic> toJson() => {
    };
}
