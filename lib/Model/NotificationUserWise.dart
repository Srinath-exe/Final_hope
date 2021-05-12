// To parse this JSON data, do
//
//     final getNotificationUserWise = getNotificationUserWiseFromJson(jsonString);

import 'dart:convert';

GetNotificationUserWise getNotificationUserWiseFromJson(String str) => GetNotificationUserWise.fromJson(json.decode(str));

String getNotificationUserWiseToJson(GetNotificationUserWise data) => json.encode(data.toJson());

class GetNotificationUserWise {
    GetNotificationUserWise();

    factory GetNotificationUserWise.fromJson(Map<String, dynamic> json) => GetNotificationUserWise(
    );

    Map<String, dynamic> toJson() => {
    };
}
