// To parse this JSON data, do
//
//     final getBrandList = getBrandListFromJson(jsonString);

import 'dart:convert';

List<GetBrandList> getBrandListFromJson(String str) => List<GetBrandList>.from(json.decode(str).map((x) => GetBrandList.fromJson(x)));

String getBrandListToJson(List<GetBrandList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetBrandList {
    GetBrandList({
        this.brdId,
        this.brdName,
        this.brdDetail,
        this.brdLogo,
        this.brdStatus,
        this.brdBrandMapcode,
    });

    String brdId;
    String brdName;
    String brdDetail;
    String brdLogo;
    String brdStatus;
    String brdBrandMapcode;

    factory GetBrandList.fromJson(Map<String, dynamic> json) => GetBrandList(
        brdId: json["brd_id"],
        brdName: json["brd_name"],
        brdDetail: json["brd_detail"],
        brdLogo: json["brd_logo"],
        brdStatus: json["brd_status"],
        brdBrandMapcode: json["brd_BrandMAPCODE"],
    );

    Map<String, dynamic> toJson() => {
        "brd_id": brdId,
        "brd_name": brdName,
        "brd_detail": brdDetail,
        "brd_logo": brdLogo,
        "brd_status": brdStatus,
        "brd_BrandMAPCODE": brdBrandMapcode,
    };
}
