// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) => ChatModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  value: json['value'] as String?,
  type: json['type'] as String?,
  icon: json['icon'] as String?,
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$ChatModelToJson(ChatModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'value': instance.value,
  'type': instance.type,
  'icon': instance.icon,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
