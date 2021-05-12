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
