// To parse this JSON data, do
//
//     final getNotificationUserWise = getNotificationUserWiseFromJson(jsonString);

import 'dart:convert';

List<GetNotificationUserWise> getNotificationUserWiseFromJson(String str) => List<GetNotificationUserWise>.from(json.decode(str).map((x) => GetNotificationUserWise.fromJson(x)));

String getNotificationUserWiseToJson(List<GetNotificationUserWise> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetNotificationUserWise {
    GetNotificationUserWise({
        this.msgId,
        this.msgUserid,
        this.msgSubject,
        this.msgMessage,
        this.msgBnrimg,
        this.msgStatus,
    });

    String msgId;
    String msgUserid;
    String msgSubject;
    String msgMessage;
    String msgBnrimg;
    String msgStatus;

    factory GetNotificationUserWise.fromJson(Map<String, dynamic> json) => GetNotificationUserWise(
        msgId: json["msg_id"],
        msgUserid: json["msg_userid"],
        msgSubject: json["msg_subject"],
        msgMessage: json["msg_message"],
        msgBnrimg: json["msg_bnrimg"],
        msgStatus: json["msg_status"],
    );

    Map<String, dynamic> toJson() => {
        "msg_id": msgId,
        "msg_userid": msgUserid,
        "msg_subject": msgSubject,
        "msg_message": msgMessage,
        "msg_bnrimg": msgBnrimg,
        "msg_status": msgStatus,
    };
}
