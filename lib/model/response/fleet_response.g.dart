// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FleetResponse _$FleetResponseFromJson(Map<String, dynamic> json) =>
    FleetResponse(
      code: (json['code'] as num?)?.toInt(),
      success: json['success'] as bool?,
      message: json['message'] as String?,
      fleetClasses: (json['fleet_classes'] as List<dynamic>?)
          ?.map((e) => FleetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FleetResponseToJson(FleetResponse instance) =>
    <String, dynamic>{
      'code': instance.code,
      'success': instance.success,
      'message': instance.message,
      'fleet_classes': instance.fleetClasses,
    };
