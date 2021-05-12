// To parse this JSON data, do
//
//     final getNotificationCount = getNotificationCountFromJson(jsonString);

import 'dart:convert';

GetNotificationCount getNotificationCountFromJson(String str) => GetNotificationCount.fromJson(json.decode(str));

String getNotificationCountToJson(GetNotificationCount data) => json.encode(data.toJson());

class GetNotificationCount {
    GetNotificationCount();

    factory GetNotificationCount.fromJson(Map<String, dynamic> json) => GetNotificationCount(
    );

    Map<String, dynamic> toJson() => {
    };
}
