// To parse this JSON data, do
//
//     final postRegister = postRegisterFromJson(jsonString);

import 'dart:convert';

PostRegister postRegisterFromJson(String str) => PostRegister.fromJson(json.decode(str));

String postRegisterToJson(PostRegister data) => json.encode(data.toJson());

class PostRegister {
    PostRegister({
        this.admFname,
        this.admLname,
        this.admEmail,
        this.admMobile,
        this.admRefferedBy,
        this.admSecert,
    });

    String admFname;
    String admLname;
    String admEmail;
    String admMobile;
    String admRefferedBy;
    String admSecert;

    factory PostRegister.fromJson(Map<String, dynamic> json) => PostRegister(
        admFname: json["adm_fname"],
        admLname: json["adm_lname"],
        admEmail: json["adm_email"],
        admMobile: json["adm_mobile"],
        admRefferedBy: json["adm_refferedBy"],
        admSecert: json["adm_secert"],
    );

    Map<String, dynamic> toJson() => {
        "adm_fname": admFname,
        "adm_lname": admLname,
        "adm_email": admEmail,
        "adm_mobile": admMobile,
        "adm_refferedBy": admRefferedBy,
        "adm_secert": admSecert,
    };
}
