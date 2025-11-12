// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'article_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArticleDetailResponse _$ArticleDetailResponseFromJson(
  Map<String, dynamic> json,
) => ArticleDetailResponse(
  code: (json['code'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  article: json['article'] == null
      ? null
      : ArticleDetailModel.fromJson(json['article'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ArticleDetailResponseToJson(
  ArticleDetailResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'article': instance.article,
};
