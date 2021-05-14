// To parse this JSON data, do
//
//     final getStoreListAll = getStoreListAllFromJson(jsonString);

import 'dart:convert';

List<GetStoreListAll> getStoreListAllFromJson(String str) => List<GetStoreListAll>.from(json.decode(str).map((x) => GetStoreListAll.fromJson(x)));

String getStoreListAllToJson(List<GetStoreListAll> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetStoreListAll {
    GetStoreListAll({
        this.strId,
        this.strStorename,
        this.strAddress,
        this.strEmail,
        this.strPhone,
        this.strCity,
        this.strGeomap,
        this.strZipcode,
        this.brands,
    });

    String strId;
    String strStorename;
    String strAddress;
    String strEmail;
    String strPhone;
    String strCity;
    String strGeomap;
    String strZipcode;
    List<Brand> brands;

    factory GetStoreListAll.fromJson(Map<String, dynamic> json) => GetStoreListAll(
        strId: json["str_id"],
        strStorename: json["str_storename"],
        strAddress: json["str_address"],
        strEmail: json["str_email"],
        strPhone: json["str_phone"],
        strCity: json["str_city"],
        strGeomap: json["str_geomap"],
        strZipcode: json["str_zipcode"],
        brands: json["brands"]!=null?List<Brand>.from(json["brands"].map((x) => Brand.fromJson(x))):[],
    );

    Map<String, dynamic> toJson() => {
        "str_id": strId,
        "str_storename": strStorename,
        "str_address": strAddress,
        "str_email": strEmail,
        "str_phone": strPhone,
        "str_city": strCity,
        "str_geomap": strGeomap,
        "str_zipcode": strZipcode,
        "brands": List<dynamic>.from(brands.map((x) => x.toJson())),
    };
}

class Brand {
    Brand({
        this.brdId,
        this.brdName,
        this.brdLogo,
    });

    String brdId;
    String brdName;
    String brdLogo;

    factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brdId: json["brd_id"],
        brdName: json["brd_name"],
        brdLogo: json["brd_logo"],
    );

    Map<String, dynamic> toJson() => {
        "brd_id": brdId,
        "brd_name": brdName,
        "brd_logo": brdLogo,
    };
}
