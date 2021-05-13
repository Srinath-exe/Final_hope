// To parse this JSON data, do
//
//     final getOffersList = getOffersListFromJson(jsonString);

import 'dart:convert';

List<GetOffersList> getOffersListFromJson(String str) => List<GetOffersList>.from(json.decode(str).map((x) => GetOffersList.fromJson(x)));

String getOffersListToJson(List<GetOffersList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOffersList {
    GetOffersList({
        this.ofrId,
        this.ofrOffer,
        this.ofrBrandid,
        this.ofrProdid,
        this.ofrValue,
        this.ofrStrtdate,
        this.ofrEnddate,
        this.ofrDetails,
        this.ofrBnrimg,
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

    factory GetOffersList.fromJson(Map<String, dynamic> json) => GetOffersList(
        ofrId: json["ofr_id"],
        ofrOffer: json["ofr_offer"],
        ofrBrandid: json["ofr_brandid"],
        ofrProdid: json["ofr_prodid"],
        ofrValue: json["ofr_value"],
        ofrStrtdate: DateTime.parse(json["ofr_strtdate"]),
        ofrEnddate: DateTime.parse(json["ofr_enddate"]),
        ofrDetails: json["ofr_details"],
        ofrBnrimg: json["ofr_bnrimg"],
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
    };
}
