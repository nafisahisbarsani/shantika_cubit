// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_city_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoCityResponse _$InfoCityResponseFromJson(Map<String, dynamic> json) =>
    InfoCityResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      cities: (json['cities'] as List<dynamic>?)
          ?.map((e) => InfoCityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InfoCityResponseToJson(InfoCityResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'cities': instance.cities,
    };
