// To parse this JSON data, do
//
//     final getCustomerPurchasesList = getCustomerPurchasesListFromJson(jsonString);

import 'dart:convert';

GetCustomerPurchasesList getCustomerPurchasesListFromJson(String str) => GetCustomerPurchasesList.fromJson(json.decode(str));

String getCustomerPurchasesListToJson(GetCustomerPurchasesList data) => json.encode(data.toJson());

class GetCustomerPurchasesList {
    GetCustomerPurchasesList();

    factory GetCustomerPurchasesList.fromJson(Map<String, dynamic> json) => GetCustomerPurchasesList(
    );

    Map<String, dynamic> toJson() => {
    };
}
