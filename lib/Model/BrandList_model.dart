// To parse this JSON data, do
//
//     final getBrandList = getBrandListFromJson(jsonString);

import 'dart:convert';

GetBrandList getBrandListFromJson(String str) => GetBrandList.fromJson(json.decode(str));

String getBrandListToJson(GetBrandList data) => json.encode(data.toJson());

class GetBrandList {
    GetBrandList();

    factory GetBrandList.fromJson(Map<String, dynamic> json) => GetBrandList(
    );

    Map<String, dynamic> toJson() => {
    };
}
