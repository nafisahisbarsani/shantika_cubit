// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fleet_class_detail_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FleetClassDetailResponse _$FleetClassDetailResponseFromJson(
  Map<String, dynamic> json,
) => FleetClassDetailResponse(
  code: (json['code'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  fleetDetail: json['fleet_detail'] == null
      ? null
      : FleetClassDetailModel.fromJson(
          json['fleet_detail'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FleetClassDetailResponseToJson(
  FleetClassDetailResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'fleet_detail': instance.fleetDetail,
};
