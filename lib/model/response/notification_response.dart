import 'package:json_annotation/json_annotation.dart';
import '../notification_model.dart';

part 'notification_response.g.dart';

@JsonSerializable(explicitToJson: true)
class NotificationResponse {
  @JsonKey(name: "code")
  int? code;

  @JsonKey(name: "success")
  bool? success;

  @JsonKey(name: "message")
  String? message;

  @JsonKey(name: "notifications")
  List<NotificationModel>? notifications;

  NotificationResponse({
    this.code,
    this.success,
    this.message,
    this.notifications,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationResponseToJson(this);
}
