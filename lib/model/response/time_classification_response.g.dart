// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_classification_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeClassificationResponse _$TimeClassificationResponseFromJson(
  Map<String, dynamic> json,
) => TimeClassificationResponse(
  code: (json['code'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  time: (json['time'] as List<dynamic>?)
      ?.map((e) => TimeClassificationModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  d: json['d'] as String?,
);

Map<String, dynamic> _$TimeClassificationResponseToJson(
  TimeClassificationResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'time': instance.time,
  'd': instance.d,
};
