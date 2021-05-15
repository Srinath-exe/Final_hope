// To parse this JSON data, do
//
//     final tnc = tncFromJson(jsonString);

import 'dart:convert';

Tnc tncFromJson(String str) => Tnc.fromJson(json.decode(str));

String tncToJson(Tnc data) => json.encode(data.toJson());

class Tnc {
    Tnc({
        this.tnc,
    });

    List<TncElement> tnc;

    factory Tnc.fromJson(Map<String, dynamic> json) => Tnc(
        tnc: List<TncElement>.from(json["tnc"].map((x) => TncElement.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "tnc": List<dynamic>.from(tnc.map((x) => x.toJson())),
    };
}

class TncElement {
    TncElement({
        this.subject,
        this.text,
    });

    String subject;
    String text;

    factory TncElement.fromJson(Map<String, dynamic> json) => TncElement(
        subject: json["subject"],
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "subject": subject,
        "text": text,
    };
}
