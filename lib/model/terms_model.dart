import 'package:json_annotation/json_annotation.dart';

part 'terms_model.g.dart';

@JsonSerializable()
class TermsModel {
  final int? id;
  final String? name;
  final String? content;

  @JsonKey(name: "created_at")
  final String? createdAt;

  @JsonKey(name: "updated_at")
  final String? updatedAt;

  TermsModel({
    this.id,
    this.name,
    this.content,
    this.createdAt,
    this.updatedAt,
  });

  factory TermsModel.fromJson(Map<String, dynamic> json) =>
      _$TermsModelFromJson(json);
  Map<String, dynamic> toJson() => _$TermsModelToJson(this);
}
