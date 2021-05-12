// To parse this JSON data, do
//
//     final getNotificationDetails = getNotificationDetailsFromJson(jsonString);

import 'dart:convert';

GetNotificationDetails getNotificationDetailsFromJson(String str) => GetNotificationDetails.fromJson(json.decode(str));

String getNotificationDetailsToJson(GetNotificationDetails data) => json.encode(data.toJson());

class GetNotificationDetails {
    GetNotificationDetails();

    factory GetNotificationDetails.fromJson(Map<String, dynamic> json) => GetNotificationDetails(
    );

    Map<String, dynamic> toJson() => {
    };
}
