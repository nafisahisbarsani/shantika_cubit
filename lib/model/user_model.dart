import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel {
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "name")
  final String? name;

  @JsonKey(name: "phone")
  final String? phone;

  @JsonKey(name: "email")
  final String? email;

  @JsonKey(name: "avatar")
  final String? avatar;

  @JsonKey(name: "birth")
  final String? birth;

  @JsonKey(name: "birth_place")
  final String? birthPlace;

  @JsonKey(name: "address")
  final String? address;

  @JsonKey(name: "gender")
  final String? gender;

  @JsonKey(name: "uuid")
  final String? uuid;

  @JsonKey(name: "deleted_at")
  final String? deletedAt;

  @JsonKey(name: "created_at")
  final String? createdAt;

  @JsonKey(name: "updated_at")
  final String? updatedAt;

  @JsonKey(name: "is_active")
  final bool? isActive;

  @JsonKey(name: "avatar_url")
  final String? avatarUrl;

  @JsonKey(name: "name_agent")
  final String? nameAgent;

  @JsonKey(name: "agencies")
  final dynamic agencies;

  UserModel({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.avatar,
    this.birth,
    this.birthPlace,
    this.address,
    this.gender,
    this.uuid,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.isActive,
    this.avatarUrl,
    this.nameAgent,
    this.agencies,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}