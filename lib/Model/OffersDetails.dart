// To parse this JSON data, do
//
//     final getOffersDetails = getOffersDetailsFromJson(jsonString);

import 'dart:convert';

GetOffersDetails getOffersDetailsFromJson(String str) => GetOffersDetails.fromJson(json.decode(str));

String getOffersDetailsToJson(GetOffersDetails data) => json.encode(data.toJson());

class GetOffersDetails {
    GetOffersDetails({
        this.slno,
        this.ofrId,
        this.ofrOffer,
        this.ofrBrandid,
        this.ofrProdid,
        this.ofrValue,
        this.ofrStrtdate,
        this.ofrEnddate,
        this.ofrDetails,
        this.ofrBnrimg,
        this.ofrStatus,
        this.ofrCreatedAt,
        this.ofrUpdatedAt,
    });

    String slno;
    String ofrId;
    String ofrOffer;
    String ofrBrandid;
    String ofrProdid;
    String ofrValue;
    DateTime ofrStrtdate;
    DateTime ofrEnddate;
    String ofrDetails;
    String ofrBnrimg;
    String ofrStatus;
    DateTime ofrCreatedAt;
    DateTime ofrUpdatedAt;

    factory GetOffersDetails.fromJson(Map<String, dynamic> json) => GetOffersDetails(
        slno: json["slno"],
        ofrId: json["ofr_id"],
        ofrOffer: json["ofr_offer"],
        ofrBrandid: json["ofr_brandid"],
        ofrProdid: json["ofr_prodid"],
        ofrValue: json["ofr_value"],
        ofrStrtdate: DateTime.parse(json["ofr_strtdate"]),
        ofrEnddate: DateTime.parse(json["ofr_enddate"]),
        ofrDetails: json["ofr_details"],
        ofrBnrimg: json["ofr_bnrimg"],
        ofrStatus: json["ofr_status"],
        ofrCreatedAt: DateTime.parse(json["ofr_createdAt"]),
        ofrUpdatedAt: DateTime.parse(json["ofr_updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "slno": slno,
        "ofr_id": ofrId,
        "ofr_offer": ofrOffer,
        "ofr_brandid": ofrBrandid,
        "ofr_prodid": ofrProdid,
        "ofr_value": ofrValue,
        "ofr_strtdate": "${ofrStrtdate.year.toString().padLeft(4, '0')}-${ofrStrtdate.month.toString().padLeft(2, '0')}-${ofrStrtdate.day.toString().padLeft(2, '0')}",
        "ofr_enddate": "${ofrEnddate.year.toString().padLeft(4, '0')}-${ofrEnddate.month.toString().padLeft(2, '0')}-${ofrEnddate.day.toString().padLeft(2, '0')}",
        "ofr_details": ofrDetails,
        "ofr_bnrimg": ofrBnrimg,
        "ofr_status": ofrStatus,
        "ofr_createdAt": ofrCreatedAt.toIso8601String(),
        "ofr_updatedAt": ofrUpdatedAt.toIso8601String(),
    };
}
