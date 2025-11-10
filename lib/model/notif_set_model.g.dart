// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notif_set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationSetModel _$NotificationSetModelFromJson(
  Map<String, dynamic> json,
) => NotificationSetModel(
  id: (json['id'] as num?)?.toInt(),
  userId: (json['user_id'] as num?)?.toInt(),
  activity: json['activity'] as bool?,
  feature: json['feature'] as bool?,
  remember: json['remember'] as bool?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$NotificationSetModelToJson(
  NotificationSetModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'user_id': instance.userId,
  'activity': instance.activity,
  'feature': instance.feature,
  'remember': instance.remember,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
