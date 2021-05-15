// To parse this JSON data, do
//
//     final getWalletDetail = getWalletDetailFromJson(jsonString);

import 'dart:convert';

GetWalletDetail getWalletDetailFromJson(String str) => GetWalletDetail.fromJson(json.decode(str));

String getWalletDetailToJson(GetWalletDetail data) => json.encode(data.toJson());

class GetWalletDetail {
    GetWalletDetail({
        this.points,
        this.amount,
    });

    String points;
    String amount;

    factory GetWalletDetail.fromJson(Map<String, dynamic> json) => GetWalletDetail(
        points: json["points"],
        amount: json["amount"],
    );

    Map<String, dynamic> toJson() => {
        "points": points,
        "amount": amount,
    };
}
