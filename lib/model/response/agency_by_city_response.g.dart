// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'agency_by_city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AgencyByCityResponse _$AgencyByCityResponseFromJson(
  Map<String, dynamic> json,
) => AgencyByCityResponse(
  code: (json['code'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  agencies: (json['agencies'] as List<dynamic>?)
      ?.map((e) => AgencyByCityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AgencyByCityResponseToJson(
  AgencyByCityResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'agencies': instance.agencies,
};
