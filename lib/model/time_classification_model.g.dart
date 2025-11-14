// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_classification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeClassificationModel _$TimeClassificationModelFromJson(
  Map<String, dynamic> json,
) => TimeClassificationModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  timeStart: json['time_start'] as String?,
  timeEnd: json['time_end'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$TimeClassificationModelToJson(
  TimeClassificationModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'time_start': instance.timeStart,
  'time_end': instance.timeEnd,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
