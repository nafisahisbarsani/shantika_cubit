// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_us_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutUsResponse _$AboutUsResponseFromJson(Map<String, dynamic> json) =>
    AboutUsResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      about: json['about'] == null
          ? null
          : AboutUsModel.fromJson(json['about'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AboutUsResponseToJson(AboutUsResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'about': instance.about,
    };
