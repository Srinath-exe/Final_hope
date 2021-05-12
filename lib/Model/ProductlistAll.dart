// To parse this JSON data, do
//
//     final getProductListAll = getProductListAllFromJson(jsonString);

import 'dart:convert';

GetProductListAll getProductListAllFromJson(String str) => GetProductListAll.fromJson(json.decode(str));

String getProductListAllToJson(GetProductListAll data) => json.encode(data.toJson());

class GetProductListAll {
    GetProductListAll();

    factory GetProductListAll.fromJson(Map<String, dynamic> json) => GetProductListAll(
    );

    Map<String, dynamic> toJson() => {
    };
}
