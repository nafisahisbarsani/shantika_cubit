// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SocialMediaResponse _$SocialMediaResponseFromJson(Map<String, dynamic> json) =>
    SocialMediaResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      socialMedias: (json['social_medias'] as List<dynamic>?)
          ?.map((e) => SocialMediaModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SocialMediaResponseToJson(
  SocialMediaResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'social_medias': instance.socialMedias,
};
