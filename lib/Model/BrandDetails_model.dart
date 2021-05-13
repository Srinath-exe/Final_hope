// To parse this JSON data, do
//
//     final getBrandDetails = getBrandDetailsFromJson(jsonString);

import 'dart:convert';

GetBrandDetails getBrandDetailsFromJson(String str) => GetBrandDetails.fromJson(json.decode(str));

String getBrandDetailsToJson(GetBrandDetails data) => json.encode(data.toJson());

class GetBrandDetails {
    GetBrandDetails({
        this.slno,
        this.brdId,
        this.brdName,
        this.brdDetail,
        this.brdLogo,
        this.brdStatus,
        this.brdBrandMapcode,
        this.brdCreatedAt,
        this.brdUpdatedAt,
    });

    String slno;
    String brdId;
    String brdName;
    String brdDetail;
    String brdLogo;
    String brdStatus;
    String brdBrandMapcode;
    DateTime brdCreatedAt;
    DateTime brdUpdatedAt;

    factory GetBrandDetails.fromJson(Map<String, dynamic> json) => GetBrandDetails(
        slno: json["slno"],
        brdId: json["brd_id"],
        brdName: json["brd_name"],
        brdDetail: json["brd_detail"],
        brdLogo: json["brd_logo"],
        brdStatus: json["brd_status"],
        brdBrandMapcode: json["brd_BrandMAPCODE"],
        brdCreatedAt: DateTime.parse(json["brd_createdAt"]),
        brdUpdatedAt: DateTime.parse(json["brd_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "brd_id": brdId,
        "brd_name": brdName,
        "brd_detail": brdDetail,
        "brd_logo": brdLogo,
        "brd_status": brdStatus,
        "brd_BrandMAPCODE": brdBrandMapcode,
        "brd_createdAt": brdCreatedAt.toIso8601String(),
        "brd_updatedAt": brdUpdatedAt.toIso8601String(),
    };
}
