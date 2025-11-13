// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  provinceId: (json['province_id'] as num?)?.toInt(),
  areaId: (json['area_id'] as num?)?.toInt(),
  pgId: json['pg_id'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  agentCount: (json['agent_count'] as num?)?.toInt(),
);

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'province_id': instance.provinceId,
  'area_id': instance.areaId,
  'pg_id': instance.pgId,
  'duration': instance.duration,
  'agent_count': instance.agentCount,
};
