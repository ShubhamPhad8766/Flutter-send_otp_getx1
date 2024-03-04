// ignore_for_file: depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

part 'error_model.g.dart';

@JsonSerializable(explicitToJson: true)
class ErrorModel {
  String? status;
  @JsonKey(name: "erroMessage")
  String? message;
  // @JsonKey(name: "message")
  // String? erroMessage;
  // String? errorCode;

  ErrorModel({
    this.status,
    this.message,
    // this.errorCode,
    // this.erroMessage
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorModelToJson(this);
}
