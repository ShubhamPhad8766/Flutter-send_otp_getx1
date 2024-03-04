class TokenData {
  String? id;
  String? name;
  dynamic password;
  String? email;
  String? phoneNumber;
  int? mobile;
  String? gender;
  String? imageUrl;
  int? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? expirationTime;
  int? expiresInMinutes;
  int? otp;
  int? iat;
  int? exp;

  TokenData({
    this.id,
    this.name,
    this.password,
    this.email,
    this.phoneNumber,
    this.mobile,
    this.gender,
    this.imageUrl,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.expirationTime,
    this.expiresInMinutes,
    this.otp,
    this.iat,
    this.exp,
  });

  factory TokenData.fromJson(Map<String, dynamic> json) => TokenData(
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phoneNumber"],
        mobile: json["mobile"],
        gender: json["gender"],
        imageUrl: json["imageUrl"],
        userId: json["userId"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        expirationTime: json["expirationTime"],
        expiresInMinutes: json["expiresInMinutes"],
        otp: json["otp"],
        iat: json["iat"],
        exp: json["exp"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "password": password,
        "email": email,
        "phoneNumber": phoneNumber,
        "mobile": mobile,
        "gender": gender,
        "imageUrl": imageUrl,
        "userId": userId,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
        "expirationTime": expirationTime,
        "expiresInMinutes": expiresInMinutes,
        "otp": otp,
        "iat": iat,
        "exp": exp,
      };
}
