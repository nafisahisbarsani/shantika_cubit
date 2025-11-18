// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_class_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FleetClassDetailModel _$FleetClassDetailModelFromJson(
  Map<String, dynamic> json,
) => FleetClassDetailModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  description: json['description'] as String?,
  image: json['image'] as String?,
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  fleetClass: json['fleet_class'] as String?,
  totalChair: (json['total_chair'] as num?)?.toInt(),
  estimateTime: json['estimate_time'] as String?,
  facilities: (json['facilities'] as List<dynamic>?)
      ?.map((e) => Facility.fromJson(e as Map<String, dynamic>))
      .toList(),
  route: json['route'] as List<dynamic>?,
);

Map<String, dynamic> _$FleetClassDetailModelToJson(
  FleetClassDetailModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'image': instance.image,
  'images': instance.images,
  'fleet_class': instance.fleetClass,
  'total_chair': instance.totalChair,
  'estimate_time': instance.estimateTime,
  'facilities': instance.facilities,
  'route': instance.route,
};

Facility _$FacilityFromJson(Map<String, dynamic> json) => Facility(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  image: json['image'] as String?,
  createdAt: json['created_at'] == null
      ? null
      : DateTime.parse(json['created_at'] as String),
  updatedAt: json['updated_at'] == null
      ? null
      : DateTime.parse(json['updated_at'] as String),
);

Map<String, dynamic> _$FacilityToJson(Facility instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'image': instance.image,
  'created_at': instance.createdAt?.toIso8601String(),
  'updated_at': instance.updatedAt?.toIso8601String(),
};
