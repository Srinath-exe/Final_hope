// To parse this JSON data, do
//
//     final getStoreDetail = getStoreDetailFromJson(jsonString);

import 'dart:convert';

GetStoreDetail getStoreDetailFromJson(String str) => GetStoreDetail.fromJson(json.decode(str));

String getStoreDetailToJson(GetStoreDetail data) => json.encode(data.toJson());

class GetStoreDetail {
    GetStoreDetail();

    factory GetStoreDetail.fromJson(Map<String, dynamic> json) => GetStoreDetail(
    );

    Map<String, dynamic> toJson() => {
    };
}
