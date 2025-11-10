import 'package:json_annotation/json_annotation.dart';

part 'policy_model.g.dart';

@JsonSerializable()
class PrivacyPolicyModel {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "content")
  String? content;
  @JsonKey(name: "created_at")
  DateTime? createdAt;
  @JsonKey(name: "updated_at")
  DateTime? updatedAt;

  PrivacyPolicyModel({
    this.id,
    this.name,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyPolicyModelFromJson(json);

  Map<String, dynamic> toJson() => _$PrivacyPolicyModelToJson(this);
}
