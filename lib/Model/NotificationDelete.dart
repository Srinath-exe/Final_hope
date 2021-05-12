// To parse this JSON data, do
//
//     final getNotificationDelete = getNotificationDeleteFromJson(jsonString);

import 'dart:convert';

GetNotificationDelete getNotificationDeleteFromJson(String str) => GetNotificationDelete.fromJson(json.decode(str));

String getNotificationDeleteToJson(GetNotificationDelete data) => json.encode(data.toJson());

class GetNotificationDelete {
    GetNotificationDelete();

    factory GetNotificationDelete.fromJson(Map<String, dynamic> json) => GetNotificationDelete(
    );

    Map<String, dynamic> toJson() => {
    };
}
