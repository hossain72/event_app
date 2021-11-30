// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

NotificationModel notificationModelFromJson(String str) => NotificationModel.fromJson(json.decode(str));

String notificationModelToJson(NotificationModel data) => json.encode(data.toJson());

class NotificationModel {
  NotificationModel({
    this.success,
    this.message,
    this.data,
    this.queries,
  });

  bool? success;
  String? message;
  List<Notification>? data;
  Queries? queries;

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    success: json["success"],
    message: json["message"],
    data: List<Notification>.from(json["data"].map((x) => Notification.fromJson(x))),
    queries: Queries.fromJson(json["queries"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "queries": queries!.toJson(),
  };
}

class Notification {
  Notification({
    this.id,
    this.title,
    this.body,
    this.action,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  String? body;
  String? action;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Notification.fromJson(Map<String, dynamic> json) => Notification(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    action: json["action"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "action": action,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
  };
}

class Queries {
  Queries({
    this.log,
    this.time,
    this.duplicates,
  });

  List<dynamic>? log;
  int? time;
  int? duplicates;

  factory Queries.fromJson(Map<String, dynamic> json) => Queries(
    log: List<dynamic>.from(json["log"].map((x) => x)),
    time: json["time"],
    duplicates: json["duplicates"],
  );

  Map<String, dynamic> toJson() => {
    "log": List<dynamic>.from(log!.map((x) => x)),
    "time": time,
    "duplicates": duplicates,
  };
}
