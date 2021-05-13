// To parse this JSON data, do
//
//     final getProductListAll = getProductListAllFromJson(jsonString);

import 'dart:convert';

List<GetProductListAll> getProductListAllFromJson(String str) => List<GetProductListAll>.from(json.decode(str).map((x) => GetProductListAll.fromJson(x)));

String getProductListAllToJson(List<GetProductListAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductListAll {
    GetProductListAll({
        this.prdId,
        this.prdCustid,
        this.prdName,
        this.prdBrandid,
        this.prdDetail,
        this.prdImage,
    });

    String prdId;
    String prdCustid;
    String prdName;
    String prdBrandid;
    String prdDetail;
    String prdImage;

    factory GetProductListAll.fromJson(Map<String, dynamic> json) => GetProductListAll(
        prdId: json["prd_id"],
        prdCustid: json["prd_custid"],
        prdName: json["prd_name"],
        prdBrandid: json["prd_brandid"],
        prdDetail: json["prd_detail"],
        prdImage: json["prd_image"],
    );

    Map<String, dynamic> toJson() => {
        "prd_id": prdId,
        "prd_custid": prdCustid,
        "prd_name": prdName,
        "prd_brandid": prdBrandid,
        "prd_detail": prdDetail,
        "prd_image": prdImage,
    };
}
