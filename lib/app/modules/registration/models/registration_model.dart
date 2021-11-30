// To parse this JSON data, do
//
//     final registrationModel = registrationModelFromJson(jsonString);

import 'dart:convert';

RegistrationModel registrationModelFromJson(String str) => RegistrationModel.fromJson(json.decode(str));

String registrationModelToJson(RegistrationModel data) => json.encode(data.toJson());

class RegistrationModel {
  RegistrationModel({
    this.success,
    this.message,
    this.data,
    this.queries,
  });

  bool? success;
  String? message;
  Data? data;
  Queries? queries;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) => RegistrationModel(
    success: json["success"],
    message: json["message"],
    data: Data.fromJson(json["data"]),
    queries: Queries.fromJson(json["queries"]),
  );

  Map<String, dynamic> toJson() => {
    "success": success,
    "message": message,
    "data": data!.toJson(),
    "queries": queries!.toJson(),
  };
}

class Data {
  Data({
    this.accessToken,
    this.tokenType,
    this.expiresIn,
  });

  String? accessToken;
  String? tokenType;
  int? expiresIn;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    accessToken: json["access_token"],
    tokenType: json["token_type"],
    expiresIn: json["expires_in"],
  );

  Map<String, dynamic> toJson() => {
    "access_token": accessToken,
    "token_type": tokenType,
    "expires_in": expiresIn,
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
