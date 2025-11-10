import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/notif_set_model.dart';

part 'notification_set_response.g.dart';

@JsonSerializable()
class NotifSetResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "setting")
  NotificationSetModel? setting;

  NotifSetResponse({this.code, this.success, this.message, this.setting});

  factory NotifSetResponse.fromJson(Map<String, dynamic> json) =>
      _$NotifSetResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotifSetResponseToJson(this);
}
