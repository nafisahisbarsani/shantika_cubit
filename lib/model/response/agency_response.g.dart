// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyResponse _$AgencyResponseFromJson(Map<String, dynamic> json) =>
    AgencyResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      agenciesCity: (json['agencies_city'] as List<dynamic>?)
          ?.map((e) => AgencyModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AgencyResponseToJson(AgencyResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'agencies_city': instance.agenciesCity,
    };
