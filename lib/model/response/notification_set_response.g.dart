// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_set_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifSetResponse _$NotifSetResponseFromJson(Map<String, dynamic> json) =>
    NotifSetResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      setting: json['setting'] == null
          ? null
          : NotificationSetModel.fromJson(
              json['setting'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$NotifSetResponseToJson(NotifSetResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'setting': instance.setting,
    };
