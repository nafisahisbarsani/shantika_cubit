// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  avatar: json['avatar'] as String?,
  birth: json['birth'] as String?,
  birthPlace: json['birth_place'] as String?,
  address: json['address'] as String?,
  gender: json['gender'] as String?,
  uuid: json['uuid'] as String?,
  deletedAt: json['deleted_at'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
  isActive: json['is_active'] as bool?,
  avatarUrl: json['avatar_url'] as String?,
  nameAgent: json['name_agent'] as String?,
  agencies: json['agencies'],
);

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phone': instance.phone,
  'email': instance.email,
  'avatar': instance.avatar,
  'birth': instance.birth,
  'birth_place': instance.birthPlace,
  'address': instance.address,
  'gender': instance.gender,
  'uuid': instance.uuid,
  'deleted_at': instance.deletedAt,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
  'is_active': instance.isActive,
  'avatar_url': instance.avatarUrl,
  'name_agent': instance.nameAgent,
  'agencies': instance.agencies,
};
