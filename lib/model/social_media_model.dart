import 'package:json_annotation/json_annotation.dart';

part 'social_media_model.g.dart';

@JsonSerializable()
class SocialMediaModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "icon")
  String? icon;
  @JsonKey(name: "value")
  String? value;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  SocialMediaModel({
    this.id,
    this.name,
    this.icon,
    this.value,
    this.createdAt,
    this.updatedAt,
  });

  factory SocialMediaModel.fromJson(Map<String, dynamic> json) =>
      _$SocialMediaModelFromJson(json);

  Map<String, dynamic> toJson() => _$SocialMediaModelToJson(this);
}
