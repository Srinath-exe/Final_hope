// To parse this JSON data, do
//
//     final ProfileModel = ProfileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
    ProfileModel({
        this.admId,
        this.admFname,
        this.admLname,
        this.admEmail,
        this.admMobile,
        this.admPropic,
        this.admCardnum,
        this.admReffercode,
        this.admJoining,
        this.admValidity,
    });

    String admId;
    String admFname;
    String admLname;
    String admEmail;
    String admMobile;
    String admPropic;
    String admCardnum;
    String admReffercode;
    DateTime admJoining;
    DateTime admValidity;

    factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        admId: json["adm_id"],
        admFname: json["adm_fname"],
        admLname: json["adm_lname"],
        admEmail: json["adm_email"],
        admMobile: json["adm_mobile"],
        admPropic: json["adm_propic"],
        admCardnum: json["adm_cardnum"],
        admReffercode: json["adm_reffercode"],
        admJoining: DateTime.parse(json["adm_joining"]),
        admValidity: DateTime.parse(json["adm_validity"]),
    );

    Map<String, dynamic> toJson() => {
        "adm_id": admId,
        "adm_fname": admFname,
        "adm_lname": admLname,
        "adm_email": admEmail,
        "adm_mobile": admMobile,
        "adm_propic": admPropic,
        "adm_cardnum": admCardnum,
        "adm_reffercode": admReffercode,
        "adm_joining": "${admJoining.year.toString().padLeft(4, '0')}-${admJoining.month.toString().padLeft(2, '0')}-${admJoining.day.toString().padLeft(2, '0')}",
        "adm_validity": "${admValidity.year.toString().padLeft(4, '0')}-${admValidity.month.toString().padLeft(2, '0')}-${admValidity.day.toString().padLeft(2, '0')}",
    };
}
