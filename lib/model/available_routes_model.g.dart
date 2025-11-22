// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_routes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableRoutesModel _$AvailableRoutesModelFromJson(
  Map<String, dynamic> json,
) => AvailableRoutesModel(
  id: (json['id'] as num?)?.toInt(),
  layoutId: (json['layout_id'] as num?)?.toInt(),
  routeName: json['route_name'] as String?,
  fleetName: json['fleet_name'] as String?,
  fleetDetailTime: json['fleet_detail_time'] as String?,
  fleetClass: json['fleet_class'] as String?,
  departureAt: json['departure_at'] as String?,
  price: (json['price'] as num?)?.toInt(),
  agencyId: (json['agency_id'] as num?)?.toInt(),
  chairsAvailable: (json['chairs_available'] as num?)?.toInt(),
  checkpoints: json['checkpoints'] == null
      ? null
      : Checkpoints.fromJson(json['checkpoints'] as Map<String, dynamic>),
);

Map<String, dynamic> _$AvailableRoutesModelToJson(
  AvailableRoutesModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'layout_id': instance.layoutId,
  'route_name': instance.routeName,
  'fleet_name': instance.fleetName,
  'fleet_detail_time': instance.fleetDetailTime,
  'fleet_class': instance.fleetClass,
  'departure_at': instance.departureAt,
  'price': instance.price,
  'agency_id': instance.agencyId,
  'chairs_available': instance.chairsAvailable,
  'checkpoints': instance.checkpoints,
};

Checkpoints _$CheckpointsFromJson(Map<String, dynamic> json) => Checkpoints(
  start: json['start'] == null
      ? null
      : Destination.fromJson(json['start'] as Map<String, dynamic>),
  destination: json['destination'] == null
      ? null
      : Destination.fromJson(json['destination'] as Map<String, dynamic>),
  end: json['end'] == null
      ? null
      : Destination.fromJson(json['end'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CheckpointsToJson(Checkpoints instance) =>
    <String, dynamic>{
      'start': instance.start,
      'destination': instance.destination,
      'end': instance.end,
    };

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
  agencyId: (json['agency_id'] as num?)?.toInt(),
  agencyName: json['agency_name'] as String?,
  agencyAddress: json['agency_address'] as String?,
  agencyPhone: json['agency_phone'] as String?,
  agencyLat: json['agency_lat'] as String?,
  agencyLng: json['agency_lng'] as String?,
  cityName: json['city_name'] as String?,
);

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'agency_id': instance.agencyId,
      'agency_name': instance.agencyName,
      'agency_address': instance.agencyAddress,
      'agency_phone': instance.agencyPhone,
      'agency_lat': instance.agencyLat,
      'agency_lng': instance.agencyLng,
      'city_name': instance.cityName,
    };
