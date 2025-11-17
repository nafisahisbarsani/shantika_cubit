// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_agen_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoAgenResponse _$InfoAgenResponseFromJson(Map<String, dynamic> json) =>
    InfoAgenResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      agencies: (json['agencies'] as List<dynamic>?)
          ?.map((e) => InfoAgenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InfoAgenResponseToJson(InfoAgenResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'agencies': instance.agencies?.map((e) => e.toJson()).toList(),
    };
