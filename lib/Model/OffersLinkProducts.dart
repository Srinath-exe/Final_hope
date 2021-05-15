// To parse this JSON data, do
//
//     final getOffersLinkedProducts = getOffersLinkedProductsFromJson(jsonString);

import 'dart:convert';

List<GetOffersLinkedProducts> getOffersLinkedProductsFromJson(String str) => List<GetOffersLinkedProducts>.from(json.decode(str).map((x) => GetOffersLinkedProducts.fromJson(x)));

String getOffersLinkedProductsToJson(List<GetOffersLinkedProducts> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOffersLinkedProducts {
    GetOffersLinkedProducts({
        this.ofrId,
        this.ofrOffer,
        this.ofrBrandid,
        this.ofrProdid,
        this.ofrValue,
        this.ofrStrtdate,
        this.ofrEnddate,
        this.ofrDetails,
        this.ofrBnrimg,
        this.offprods,
    });

    String ofrId;
    String ofrOffer;
    String ofrBrandid;
    String ofrProdid;
    String ofrValue;
    DateTime ofrStrtdate;
    DateTime ofrEnddate;
    String ofrDetails;
    String ofrBnrimg;
    Offprods offprods;

    factory GetOffersLinkedProducts.fromJson(Map<String, dynamic> json) => GetOffersLinkedProducts(
        ofrId: json["ofr_id"],
        ofrOffer: json["ofr_offer"],
        ofrBrandid: json["ofr_brandid"],
        ofrProdid: json["ofr_prodid"],
        ofrValue: json["ofr_value"],
        ofrStrtdate: DateTime.parse(json["ofr_strtdate"]),
        ofrEnddate: DateTime.parse(json["ofr_enddate"]),
        ofrDetails: json["ofr_details"],
        ofrBnrimg: json["ofr_bnrimg"],
        offprods: Offprods.fromJson(json["offprods"]),
    );

    Map<String, dynamic> toJson() => {
        "ofr_id": ofrId,
        "ofr_offer": ofrOffer,
        "ofr_brandid": ofrBrandid,
        "ofr_prodid": ofrProdid,
        "ofr_value": ofrValue,
        "ofr_strtdate": "${ofrStrtdate.year.toString().padLeft(4, '0')}-${ofrStrtdate.month.toString().padLeft(2, '0')}-${ofrStrtdate.day.toString().padLeft(2, '0')}",
        "ofr_enddate": "${ofrEnddate.year.toString().padLeft(4, '0')}-${ofrEnddate.month.toString().padLeft(2, '0')}-${ofrEnddate.day.toString().padLeft(2, '0')}",
        "ofr_details": ofrDetails,
        "ofr_bnrimg": ofrBnrimg,
        "offprods": offprods.toJson(),
    };
}

class Offprods {
    Offprods({
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

    factory Offprods.fromJson(Map<String, dynamic> json) => Offprods(
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
