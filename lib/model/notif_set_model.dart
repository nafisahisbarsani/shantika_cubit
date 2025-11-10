import 'package:json_annotation/json_annotation.dart';

part 'notif_set_model.g.dart';

@JsonSerializable()
class NotificationSetModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "user_id")
  int? userId;
  @JsonKey(name: "activity")
  bool? activity;
  @JsonKey(name: "feature")
  bool? feature;
  @JsonKey(name: "remember")
  bool? remember;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  NotificationSetModel({
    this.id,
    this.userId,
    this.activity,
    this.feature,
    this.remember,
    this.createdAt,
    this.updatedAt,
  });

  factory NotificationSetModel.fromJson(Map<String, dynamic> json) => _$NotificationSetModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationSetModelToJson(this);
}
