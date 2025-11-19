// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModel _$OrderListModelFromJson(Map<String, dynamic> json) =>
    OrderListModel(
      id: (json['id'] as num?)?.toInt(),
      codeOrder: json['code_order'] as String?,
      nameFleet: json['name_fleet'] as String?,
      fleetClass: json['fleet_class'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      departureAt: json['departure_at'] as String?,
      price: (json['price'] as num?)?.toInt(),
      status: json['status'] as String?,
      checkpoints: json['checkpoints'] == null
          ? null
          : Checkpoints.fromJson(json['checkpoints'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderListModelToJson(OrderListModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'code_order': instance.codeOrder,
      'name_fleet': instance.nameFleet,
      'fleet_class': instance.fleetClass,
      'created_at': instance.createdAt?.toIso8601String(),
      'departure_at': instance.departureAt,
      'price': instance.price,
      'status': instance.status,
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
