// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'info_city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InfoCityModel _$InfoCityModelFromJson(Map<String, dynamic> json) =>
    InfoCityModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      areaId: (json['area_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$InfoCityModelToJson(InfoCityModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area_id': instance.areaId,
    };
