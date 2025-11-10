import 'package:json_annotation/json_annotation.dart';

part 'about_us_model.g.dart';

@JsonSerializable()
class AboutUsModel {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "image")
  final String? image;
  @JsonKey(name: "description")
  final String? description;
  @JsonKey(name: "address")
  final String? address;
  @JsonKey(name: "created_at")
  final DateTime? createdAt;
  @JsonKey(name: "updated_at")
  final DateTime? updatedAt;

  AboutUsModel({
    this.id,
    this.image,
    this.description,
    this.address,
    this.createdAt,
    this.updatedAt,
  });

  factory AboutUsModel.fromJson(Map<String, dynamic> json) =>
      _$AboutUsModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutUsModelToJson(this);
}
