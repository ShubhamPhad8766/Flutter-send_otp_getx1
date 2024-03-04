
class GetModel {
    int? userId;
    int? id;
    String? title;
    String? body;

    GetModel({
        this.userId,
        this.id,
        this.title,
        this.body,
    });

    factory GetModel.fromJson(Map<String, dynamic> json) => GetModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
