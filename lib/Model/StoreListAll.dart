// To parse this JSON data, do
//
//     final getStoreListAll = getStoreListAllFromJson(jsonString);

import 'dart:convert';

GetStoreListAll getStoreListAllFromJson(String str) => GetStoreListAll.fromJson(json.decode(str));

String getStoreListAllToJson(GetStoreListAll data) => json.encode(data.toJson());

class GetStoreListAll {
    GetStoreListAll();

    factory GetStoreListAll.fromJson(Map<String, dynamic> json) => GetStoreListAll(
    );

    Map<String, dynamic> toJson() => {
    };
}
