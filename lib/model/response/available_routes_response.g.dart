// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'available_routes_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvailableRoutesResponse _$AvailableRoutesResponseFromJson(
  Map<String, dynamic> json,
) => AvailableRoutesResponse(
  code: (json['code'] as num?)?.toInt(),
  success: json['success'] as bool?,
  message: json['message'] as String?,
  routes: (json['routes'] as List<dynamic>?)
      ?.map((e) => AvailableRoutesModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$AvailableRoutesResponseToJson(
  AvailableRoutesResponse instance,
) => <String, dynamic>{
  'code': instance.code,
  'success': instance.success,
  'message': instance.message,
  'routes': instance.routes,
};
