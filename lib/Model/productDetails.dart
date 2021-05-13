// To parse this JSON data, do
//
//     final getProductDetails = getProductDetailsFromJson(jsonString);

import 'dart:convert';

GetProductDetails getProductDetailsFromJson(String str) => GetProductDetails.fromJson(json.decode(str));

String getProductDetailsToJson(GetProductDetails data) => json.encode(data.toJson());

class GetProductDetails {
    GetProductDetails({
        this.slno,
        this.prdId,
        this.prdCustid,
        this.prdName,
        this.prdBrandid,
        this.prdDetail,
        this.prdImage,
        this.prdStrtdate,
        this.prdEnddate,
        this.prdPrice,
        this.prdPoints,
        this.prdType,
        this.prdStatus,
        this.prdPrdmapcode,
        this.prdCreatedAt,
        this.prdUpdatedAt,
    });

    String slno;
    String prdId;
    String prdCustid;
    String prdName;
    String prdBrandid;
    String prdDetail;
    String prdImage;
    DateTime prdStrtdate;
    DateTime prdEnddate;
    String prdPrice;
    String prdPoints;
    String prdType;
    String prdStatus;
    String prdPrdmapcode;
    DateTime prdCreatedAt;
    DateTime prdUpdatedAt;

    factory GetProductDetails.fromJson(Map<String, dynamic> json) => GetProductDetails(
        slno: json["slno"],
        prdId: json["prd_id"],
        prdCustid: json["prd_custid"],
        prdName: json["prd_name"],
        prdBrandid: json["prd_brandid"],
        prdDetail: json["prd_detail"],
        prdImage: json["prd_image"],
        prdStrtdate: DateTime.parse(json["prd_strtdate"]),
        prdEnddate: DateTime.parse(json["prd_enddate"]),
        prdPrice: json["prd_price"],
        prdPoints: json["prd_points"],
        prdType: json["prd_type"],
        prdStatus: json["prd_status"],
        prdPrdmapcode: json["prd_PRDMAPCODE"],
        prdCreatedAt: DateTime.parse(json["prd_createdAt"]),
        prdUpdatedAt: DateTime.parse(json["prd_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "prd_id": prdId,
        "prd_custid": prdCustid,
        "prd_name": prdName,
        "prd_brandid": prdBrandid,
        "prd_detail": prdDetail,
        "prd_image": prdImage,
        "prd_strtdate": "${prdStrtdate.year.toString().padLeft(4, '0')}-${prdStrtdate.month.toString().padLeft(2, '0')}-${prdStrtdate.day.toString().padLeft(2, '0')}",
        "prd_enddate": "${prdEnddate.year.toString().padLeft(4, '0')}-${prdEnddate.month.toString().padLeft(2, '0')}-${prdEnddate.day.toString().padLeft(2, '0')}",
        "prd_price": prdPrice,
        "prd_points": prdPoints,
        "prd_type": prdType,
        "prd_status": prdStatus,
        "prd_PRDMAPCODE": prdPrdmapcode,
        "prd_createdAt": prdCreatedAt.toIso8601String(),
        "prd_updatedAt": prdUpdatedAt.toIso8601String(),
    };
}
