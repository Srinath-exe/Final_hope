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
        this.admSecret,
    });

    String admFname;
    String admLname;
    String admEmail;
    String admMobile;
    String admRefferedBy;
    String admSecret;

    factory PostRegister.fromJson(Map<String, dynamic> json) => PostRegister(
        admFname: json["adm_fname"],
        admLname: json["adm_lname"],
        admEmail: json["adm_email"],
        admMobile: json["adm_mobile"],
        admRefferedBy: json["adm_refferedBy"],
        admSecret: json["adm_secret"],
    );

    Map<String, dynamic> toJson() => {
        "adm_fname": admFname,
        "adm_lname": admLname,
        "adm_email": admEmail,
        "adm_mobile": admMobile,
        "adm_refferedBy": admRefferedBy,
        "adm_secret": admSecret,
    };
}
// To parse this JSON data, do
//
// To parse this JSON data, do
//


ResponseSignUp responseSignUpFromJson(String str) => ResponseSignUp.fromJson(json.decode(str));

String responseSignUpToJson(ResponseSignUp data) => json.encode(data.toJson());

class ResponseSignUp {
    ResponseSignUp({
        this.otp,
        this.error,
        this.token,
        this.expires,
        this.uuid,
    });

    int otp;
    bool error;
    String token;
    int expires;
    String uuid;

    factory ResponseSignUp.fromJson(Map<String, dynamic> json) => ResponseSignUp(
        otp: json["otp"],
        error: json["error"],
        token: json["token"],
        expires: json["expires"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "otp": otp,
        "error": error,
        "token": token,
        "expires": expires,
        "uuid": uuid,
    };
}
