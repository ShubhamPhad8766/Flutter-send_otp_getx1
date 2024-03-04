// To parse this JSON data, do
//
//     final tokenData = tokenDataFromJson(jsonString);

import 'dart:convert';

VerifyTokenModel tokenDataFromJson(String str) => VerifyTokenModel.fromJson(json.decode(str));

String tokenDataToJson(VerifyTokenModel data) => json.encode(data.toJson());

class VerifyTokenModel {
    String? status;
    String? message;
    Data? data;
    dynamic token;

    VerifyTokenModel({
        this.status,
        this.message,
        this.data,
        this.token,
    });

    factory VerifyTokenModel.fromJson(Map<String, dynamic> json) => VerifyTokenModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        token: json["token"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "token": token,
    };
}

class Data {
    bool? userExists;
    bool? customerExists;
    bool? memberExists;

    Data({
        this.userExists,
        this.customerExists,
        this.memberExists,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userExists: json["userExists"],
        customerExists: json["customerExists"],
        memberExists: json["memberExists"],
    );

    Map<String, dynamic> toJson() => {
        "userExists": userExists,
        "customerExists": customerExists,
        "memberExists": memberExists,
    };
}
