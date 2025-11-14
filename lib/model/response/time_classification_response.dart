import 'package:json_annotation/json_annotation.dart';
import 'package:shantika_cubit/model/time_classification_model.dart';

part 'time_classification_response.g.dart';

@JsonSerializable()
class TimeClassificationResponse {
  @JsonKey(name: "code")
  int? code;
  @JsonKey(name: "success")
  bool? success;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "time")
  List<TimeClassificationModel>? time;
  @JsonKey(name: "d")
  String? d;

  TimeClassificationResponse({
    this.code,
    this.success,
    this.message,
    this.time,
    this.d,
  });

  factory TimeClassificationResponse.fromJson(Map<String, dynamic> json) =>
      _$TimeClassificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TimeClassificationResponseToJson(this);
}
