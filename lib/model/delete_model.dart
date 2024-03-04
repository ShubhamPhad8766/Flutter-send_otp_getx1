// To parse this JSON data, do
//
//     final deleteModel = deleteModelFromJson(jsonString);

import 'dart:convert';

List<DeleteModel> deleteModelFromJson(String str) => List<DeleteModel>.from(json.decode(str).map((x) => DeleteModel.fromJson(x)));

String deleteModelToJson(List<DeleteModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeleteModel {
    int? createdAt;
    String? name;
    dynamic avatar;
    String? id;
    int? creatAt;

    DeleteModel({
        this.createdAt,
        this.name,
        this.avatar,
        this.id,
        this.creatAt,
    });

    factory DeleteModel.fromJson(Map<String, dynamic> json) => DeleteModel(
        createdAt: json["createdAt"],
        name: json["name"],
        avatar: json["avatar"],
        id: json["id"],
        creatAt: json["creatAt"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt,
        "name": name,
        "avatar": avatar,
        "id": id,
        "creatAt": creatAt,
    };
}
