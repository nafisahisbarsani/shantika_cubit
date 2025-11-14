import 'package:json_annotation/json_annotation.dart';

part 'time_classification_model.g.dart';

@JsonSerializable()
class TimeClassificationModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "time_start")
  String? timeStart;
  @JsonKey(name: "time_end")
  String? timeEnd;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  TimeClassificationModel({
    this.id,
    this.name,
    this.timeStart,
    this.timeEnd,
    this.createdAt,
    this.updatedAt,
  });

  factory TimeClassificationModel.fromJson(Map<String, dynamic> json) => _$TimeClassificationModelFromJson(json);

  Map<String, dynamic> toJson() => _$TimeClassificationModelToJson(this);
}
