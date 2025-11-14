// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FleetModel _$FleetModelFromJson(Map<String, dynamic> json) => FleetModel(
  id: (json['id'] as num?)?.toInt(),
  name: json['name'] as String?,
  priceFood: json['price_food'] as String?,
  code: json['code'] as String?,
  fleetsCount: (json['fleets_count'] as num?)?.toInt(),
  priceFleetClass1: (json['price_fleet_class1'] as num?)?.toInt(),
  priceFleetClass2: (json['price_fleet_class2'] as num?)?.toInt(),
  seatCapacity: (json['seat_capacity'] as num?)?.toInt(),
);

Map<String, dynamic> _$FleetModelToJson(FleetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price_food': instance.priceFood,
      'code': instance.code,
      'fleets_count': instance.fleetsCount,
      'price_fleet_class1': instance.priceFleetClass1,
      'price_fleet_class2': instance.priceFleetClass2,
      'seat_capacity': instance.seatCapacity,
    };
