// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityResponse _$CityResponseFromJson(Map<String, dynamic> json) => CityResponse(
  code: (json['code'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  cities: (json['cities'] as List<dynamic>?)
      ?.map((e) => CityModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$CityResponseToJson(CityResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'cities': instance.cities,
    };
