// To parse this JSON data, do
//
//     final responseForgotPassword = responseForgotPasswordFromJson(jsonString);

import 'dart:convert';

ResponseForgotPassword responseForgotPasswordFromJson(String str) => ResponseForgotPassword.fromJson(json.decode(str));

String responseForgotPasswordToJson(ResponseForgotPassword data) => json.encode(data.toJson());

class ResponseForgotPassword {
    ResponseForgotPassword({
        this.admId,
        this.admFname,
        this.admLname,
        this.admEmail,
        this.admMobile,
        this.admValidity,
        this.otp,
    });

    String admId;
    String admFname;
    String admLname;
    String admEmail;
    String admMobile;
    DateTime admValidity;
    int otp;

    factory ResponseForgotPassword.fromJson(Map<String, dynamic> json) => ResponseForgotPassword(
        admId: json["adm_id"],
        admFname: json["adm_fname"],
        admLname: json["adm_lname"],
        admEmail: json["adm_email"],
        admMobile: json["adm_mobile"],
        admValidity: DateTime.parse(json["adm_validity"]),
        otp: json["otp"],
    );

    Map<String, dynamic> toJson() => {
        "adm_id": admId,
        "adm_fname": admFname,
        "adm_lname": admLname,
        "adm_email": admEmail,
        "adm_mobile": admMobile,
        "adm_validity": "${admValidity.year.toString().padLeft(4, '0')}-${admValidity.month.toString().padLeft(2, '0')}-${admValidity.day.toString().padLeft(2, '0')}",
        "otp": otp,
    };
}

// POSt forfot password
PostForgotPassword postForgotPasswordFromJson(String str) => PostForgotPassword.fromJson(json.decode(str));

String postForgotPasswordToJson(PostForgotPassword data) => json.encode(data.toJson());

class PostForgotPassword {
    PostForgotPassword({
        this.admMobile,
    });

    String admMobile;

    factory PostForgotPassword.fromJson(Map<String, dynamic> json) => PostForgotPassword(
        admMobile: json["adm_mobile"],
    );

    Map<String, dynamic> toJson() => {
        "adm_mobile": admMobile,
    };
}
// To parse this JSON data, do
//
//     final postResetPassword = postResetPasswordFromJson(jsonString);


PostResetPassword postResetPasswordFromJson(String str) => PostResetPassword.fromJson(json.decode(str));

String postResetPasswordToJson(PostResetPassword data) => json.encode(data.toJson());

class PostResetPassword {
    PostResetPassword({
        this.admMobile,
        this.otp,
        this.admId,
        this.passcode,
    });

    String admMobile;
    int otp;
    String admId;
    String passcode;

    factory PostResetPassword.fromJson(Map<String, dynamic> json) => PostResetPassword(
        admMobile: json["adm_mobile"],
        otp: json["otp"],
        admId: json["adm_id"],
        passcode: json["passcode"],
    );

    Map<String, dynamic> toJson() => {
        "adm_mobile": admMobile,
        "otp": otp,
        "adm_id": admId,
        "passcode": passcode,
    };
}