// To parse this JSON data, do
//
//     final postLogin = postLoginFromJson(jsonString);

import 'dart:convert';

PostLogin postLoginFromJson(String str) => PostLogin.fromJson(json.decode(str));

String postLoginToJson(PostLogin data) => json.encode(data.toJson());

class PostLogin {
    PostLogin({
        this.email,
        this.pass,
    });

    String email;
    String pass;

    factory PostLogin.fromJson(Map<String, dynamic> json) => PostLogin(
        email: json["email"],
        pass: json["pass"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "pass": pass,
    };
}
// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);


ResponseLogin responseLoginFromJson(String str) => ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
    ResponseLogin({
        this.error,
        this.token,
        this.expires,
        this.uuid,
    });

    bool error;
    String token;
    int expires;
    String uuid;

    factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        error: json["error"],
        token: json["token"],
        expires: json["expires"],
        uuid: json["uuid"],
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "token": token,
        "expires": expires,
        "uuid": uuid,
    };
}
