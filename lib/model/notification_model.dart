
import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "reference_id")
  int? referenceId;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "is_seen")
  bool? isSeen;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;
  @JsonKey(name: "deleted_at")
  dynamic deletedAt;

  NotificationModel({
    this.id,
    this.userId,
    this.referenceId,
    this.title,
    this.message,
    this.type,
    this.isSeen,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) => _$NotificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
